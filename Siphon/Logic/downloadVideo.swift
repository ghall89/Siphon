import Foundation

func downloadVideo(_ options: VideoOptions) async throws {
	let process = Process()
	process.executableURL = URL(fileURLWithPath: "/bin/bash")
	
	guard let scriptPath = Bundle.main.path(forResource: "downloadScript", ofType: "sh") else {
		throw NSError(domain: "ShellScriptErrorDomain", code: 404, userInfo: ["message": "Script not found"])
	}
	
	process.environment = ["PATH": "/opt/homebrew/bin"]
	
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

