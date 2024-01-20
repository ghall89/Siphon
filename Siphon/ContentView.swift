import SwiftUI

struct ContentView: View {
	@AppStorage("fileFormat") var fileFormat: FileFormat = .mp4
	@AppStorage("resolution") var resolution: VideoResolution = .medium
	
	@State var videoUrl: String = ""
	@State var isLoading: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				TextField(text: $videoUrl, label: {
					Text("Video URL")
				})
				.textFieldStyle(.roundedBorder)
				Button(action: { Task { await clickHandler() } }, label: {
					Image(systemName: "arrowshape.down.circle")
				})
				.disabled(isLoading)
			}
			Divider()
			HStack {
				Picker(selection: $resolution, content: {
					ForEach(VideoResolution.allCases, id: \.self) { res in
						Text("\(res.rawValue)")
					}
				},
							 label: {
					Image(systemName: "arrow.down.left.and.arrow.up.right.square.fill")
				})
				Picker(selection: $fileFormat, content: {
					ForEach(FileFormat.allCases, id: \.self) { res in
						Text("\(res.rawValue)")
					}
				},
							 label: {
					Image(systemName: "film.stack.fill")
				}
				)
			}
		}
		.padding()
		.frame(width: 400)
	}
	
	private func clickHandler() async {
		isLoading = true
		do {
			try await downloadVideo(
				VideoOptions(
					url: videoUrl,
					fileFormat: fileFormat,
					resolution: resolution)
			)
		} catch {
			print(error)
		}
		isLoading = false
	}
}
