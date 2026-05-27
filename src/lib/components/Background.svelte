<script lang="ts">
	import vertexShaderSource from "$lib/shaders/background.vert.glsl?raw";
	import fragmentShaderSource from "$lib/shaders/background.frag.glsl?raw";
	import type { Attachment } from "svelte/attachments";
	import { err, ok, safeTry, type Result } from "neverthrow";
	import { cn } from "$lib/utils";
	import { match, P } from "ts-pattern";
	import { dev } from "$app/environment";

	let width: number = $state(1920);
	let height: number = $state(1080);

	// i miss rust...
	type Status =
		| { type: "loading"; stage: "loading" | "compile" | "link" }
		| { type: "failed"; error: string }
		| { type: "rendered" };
	let status = $state<Status>({ type: "loading", stage: "loading" });
	if (dev)
		$effect(() => {
			console.log(status);
		});
	let isAttached = $state(false);

	const background: Attachment<HTMLCanvasElement> = (element) => {
		isAttached = true;
		const gl = element.getContext("webgl2");
		if (!gl) return;
		const positionBuffer = initPositionBuffer(gl);
		const res = safeTry(function* () {
			const program = yield* initShaderProgram(gl);
			const locations = yield* getLocations(gl, program);
			return ok([program, locations] as const);
		});
		if (res.isErr()) {
			status = { type: "failed", error: res.error };
			console.error(res.error);
			return;
		}
		const [program, locations] = res.value;

		requestAnimationFrame(function frame() {
			if (status.type !== "rendered") status = { type: "rendered" };
			drawScene(gl, program, positionBuffer, locations);
			if (isAttached) requestAnimationFrame(frame);
		});
		return () => (isAttached = false);
	};

	function initPositionBuffer(gl: WebGL2RenderingContext) {
		const positionBuffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);

		const positions = [1.0, 1.0, -1.0, 1.0, 1.0, -1.0, -1.0, -1.0];
		gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(positions), gl.STATIC_DRAW);

		return positionBuffer;
	}
	function getLocations(gl: WebGL2RenderingContext, shaderProgram: WebGLProgram) {
		function getUniformLocation(name: `u_${string}`) {
			const location = gl.getUniformLocation(shaderProgram, name);
			if (location === null) return err(`failed to get location of: uniform ${name}`);
			return ok(location);
		}
		function getAttributeLocation(name: `a_${string}`) {
			const location = gl.getAttribLocation(shaderProgram, name);
			if (location === -1) return err(`failed to get location of: attribute ${name}`);
			return ok(location);
		}

		return safeTry(function* () {
			return ok({
				time: yield* getUniformLocation("u_time"),
				position: yield* getAttributeLocation("a_position"),
				resolution: yield* getUniformLocation("u_resolution")
			});
		});
	}

	function initShaderProgram(gl: WebGL2RenderingContext): Result<WebGLProgram, string> {
		return safeTry(function* () {
			status = { type: "loading", stage: "compile" };
			const vertexShader = yield* loadShader(gl, gl.VERTEX_SHADER, vertexShaderSource);
			const fragmentShader = yield* loadShader(gl, gl.FRAGMENT_SHADER, fragmentShaderSource);

			const shaderProgram = gl.createProgram();
			gl.attachShader(shaderProgram, vertexShader);
			gl.attachShader(shaderProgram, fragmentShader);
			status = { type: "loading", stage: "link" };
			gl.linkProgram(shaderProgram);

			if (!gl.getProgramParameter(shaderProgram, gl.LINK_STATUS)) {
				return err(
					`failed to initialize shader program: ${gl.getProgramInfoLog(shaderProgram) ?? ""}`
				);
			}

			return ok(shaderProgram);
		});
	}

	function loadShader(
		gl: WebGL2RenderingContext,
		type: GLenum,
		source: string
	): Result<WebGLShader, string> {
		const shader = gl.createShader(type);
		if (!shader) return err("failed to create shader");

		gl.shaderSource(shader, source);
		gl.compileShader(shader);

		if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
			const error = err(`failed to compile shader: ${gl.getShaderInfoLog(shader) ?? ""}`);
			gl.deleteShader(shader);
			return error;
		}

		return ok(shader);
	}
	function drawScene(
		gl: WebGL2RenderingContext,
		program: WebGLProgram,
		positionBuffer: WebGLBuffer,
		locations: ReturnType<typeof getLocations> extends Result<infer T, unknown> ? T : never
	) {
		// clear
		gl.viewport(0, 0, width, height);
		gl.clearColor(0.0, 0.0, 0.0, 1.0); // #000F
		gl.clear(gl.COLOR_BUFFER_BIT);

		// vertex stuff
		gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);
		gl.vertexAttribPointer(locations.position, 2, gl.FLOAT, false, 0, 0);
		gl.enableVertexAttribArray(locations.position);

		// use program
		gl.useProgram(program);

		// uniforms
		gl.uniform1f(locations.time, performance.now() / 1000);
		gl.uniform2fv(locations.resolution, [width, height]);

		// draw
		const offset = 0;
		const vertexCount = 4;
		gl.drawArrays(gl.TRIANGLE_STRIP, offset, vertexCount);
	}
</script>

<svelte:body bind:clientWidth={width} bind:clientHeight={height} />
<canvas
	{@attach background}
	{width}
	{height}
	class={cn(
		"fixed -z-10 h-full w-full bg-black transition duration-1000",
		match(status)
			.with({ type: "rendered" }, () => "")
			.otherwise(() => "opacity-0")
	)}
></canvas>
<div
	class={cn(
		"fixed top-4 left-4 text-white/50 transition-all",
		match(status)
			.with({ type: "rendered" }, () => "opacity-0 select-none")
			.with({ type: "failed" }, () => "text-red-500")
			.otherwise(() => "")
	)}
>
	{match(status)
		.with({ type: "failed", error: P.select() }, (error) => error)
		.with({ type: "loading", stage: "loading" }, () => "loading shader...")
		.with({ type: "loading", stage: "compile" }, () => "compiling shader...")
		.with({ type: "loading", stage: "link" }, () => "linking shader...")
		.with({ type: "rendered" }, () => "shader rendered!")
		.exhaustive()}
</div>
