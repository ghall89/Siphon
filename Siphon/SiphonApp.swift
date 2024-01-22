import SwiftUI

@main
struct Video_StrawApp: App {
	@State var showAlert: Bool = false
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.onAppear(perform: {
					ytdlpCheck()
					authorizeNotifications()
				})
				.alert(isPresented: $showAlert) {
					Alert(
						title: Text("Oh no!"),
						message: Text("I'm sorry. This app requires an installation of Homebrew and yt-dlp to function."),
						primaryButton: .default(
						Text("Install"),
						action: handleInstallButton
						),
						secondaryButton: .cancel(
							Text("Quit"),
							action: handleQuitButton
						)
					)
				}
		}
		.windowResizability(.contentSize)
		.windowStyle(.hiddenTitleBar)
	}
	
	private func handleInstallButton() {
		if let url = URL(
			string: "https://formulae.brew.sh/formula/yt-dlp"
		) {
			NSWorkspace.shared.open(url)
		}
		showAlert.toggle()
	}
	
	private func handleQuitButton() {
		exit(0)
	}
	
	private func ytdlpCheck() {
		// ensure yt-dlp is installed
//		let exists = ytdlpExists()
//		if !exists {
			showAlert.toggle()
//		}
	}
}
