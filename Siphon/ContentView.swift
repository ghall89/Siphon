import SwiftUI

struct ContentView: View {
	@AppStorage("fileFormat") var fileFormat: FileFormat = .mp4
	@AppStorage("resolution") var resolution: VideoResolution = .medium
	
	@State var videoUrl: String = ""
	@State var isLoading: Bool = false
	@StateObject var progress = ProgressHolder()
	
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
				.help("Download")
			}
			Divider()
			HStack {
				Picker(selection: $resolution, content: {
					ForEach(VideoResolution.allCases, id: \.self) { res in
						Text("\(res.rawValue)p")
					}
				},
							 label: {
					Image(systemName: "arrow.down.left.and.arrow.up.right.square.fill")
				})
				.help("Resolution")
			}
		}
		.padding()
		.frame(width: 400)
		.sheet(
			isPresented: $isLoading,
			content: {
			VStack {
//				ProgressView(value: progress.value, total: 100.0)
				ProgressView()
				Text("Downloading")
			}
			.padding()
		})
	}
	
	private func clickHandler() async {
		isLoading = true
		do {
			try await downloadVideo(
				VideoOptions(
					url: videoUrl,
					fileFormat: fileFormat,
					resolution: resolution),
				progressHolder: progress
			)
		} catch {
			print(error)
		}
		isLoading = false
	}
	
}

class ProgressHolder: ObservableObject {
	@Published var value: Double = 0.0
}
