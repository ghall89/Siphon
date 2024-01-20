import Foundation

struct VideoOptions {
	var url: String
	var fileFormat: FileFormat
	var resolution: VideoResolution
}

enum FileFormat: String, CaseIterable {
	case mp4 = ".mp4"
	case webp = ".webp"
}

enum VideoResolution: String, CaseIterable {
	case low = "480"
	case medium = "720"
	case high = "1080"
//	case highest = "4k"
}
