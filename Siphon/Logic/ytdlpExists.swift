import Foundation

func ytdlpExists() -> Bool {
	let fileManager = FileManager.default
	var filePath: String
	
#if arch(x86_64)
	// on Intel
	filePath = "/usr/local/bin/yt-dlp"
#elseif arch(arm64)
	// on Apple Silicon
	filePath = "/opt/homebrew/bin/yt-dlp"
#else
	print("Unknown CPU")
	return false
#endif
	
	var isDirectory: ObjCBool = false
	let exists = fileManager.fileExists(atPath: filePath, isDirectory: &isDirectory) && !isDirectory.boolValue
	
	if exists {
		return true
	} else {
		return false
	}
	
}
