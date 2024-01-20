import Foundation
import UserNotifications

func triggerNotification(_ title: String, message: String) {
	let userNotificationCenter = UNUserNotificationCenter.current()
	let notificationContent = UNMutableNotificationContent()
	
	notificationContent.title = title
	notificationContent.body = message
	
	let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
	
	let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
	
	userNotificationCenter.add(request) { (error) in
		if let error = error {
			print("Notification Error: ", error)
		}
	}
}
