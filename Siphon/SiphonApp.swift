import SwiftUI

@main
struct Video_StrawApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
				.onAppear(perform: {
					authorizeNotifications()
				})
		}
		.windowResizability(.contentSize)
		.windowStyle(.hiddenTitleBar)
	}
}
