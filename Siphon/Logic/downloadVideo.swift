import Foundation

func downloadVideo(_ options: VideoOptions) async throws {
	let process = Process()
	process.executableURL = URL(fileURLWithPath: "/bin/bash")
	
	guard let scriptPath = Bundle.main.path(forResource: "downloadScript", ofType: "sh") else {
		throw NSError(domain: "ShellScriptErrorDomain", code: 404, userInfo: ["message": "Script not found"])
	}
	
	// Use appropriate homebrew installation based on CPU
#if arch(x86_64)
	// on Intel
	process.environment = ["PATH": "/usr/local/bin"]
#elseif arch(arm64)
	// on Apple Silicon
	process.environment = ["PATH": "/opt/homebrew/bin"]
#else
	print("Unknown CPU")
#endif
	
	// yt-dlp [url] -S [resolution]
	process.arguments = [
		scriptPath,
		options.url,
		options.resolution.rawValue
	]
	
	let pipe = Pipe()
	process.standardOutput = pipe
	
	try process.run()
	
	process.waitUntilExit()
	
	if process.terminationStatus != 0 {
		triggerNotification("Download Failed", message: "There was a problem downloading the video")
	} else {
		triggerNotification("Download Success", message: "Video downloaded sucessfully")
	}
	
}

