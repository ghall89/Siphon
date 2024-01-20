import Foundation
import UserNotifications

func authorizeNotifications() {
	let userNotificationCenter = UNUserNotificationCenter.current()
	let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .sound)
	
	userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
		if let error = error {
			print("Error: ", error)
		}
	}
}
