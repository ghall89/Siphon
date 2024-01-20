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
	case low = "480p"
	case medium = "720p"
	case high = "1080p"
	case highest = "4k"
}
