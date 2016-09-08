//
//  LocalNotificationCenter.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

open class LocalNotificationCenter {
	
	fileprivate let application = UIApplication.shared
	fileprivate var scheduledNotifications: [UILocalNotification] {
		didSet {
			self.scheduledNotifications = self.scheduledNotifications.filter({ (notification) -> Bool in
				guard let fireDate = notification.fireDate else {
					return false
				}
				return fireDate.timeIntervalSinceNow >= 0
			})
			self.application.scheduledLocalNotifications = self.scheduledNotifications
		}
	}
	
	fileprivate init() {
		self.scheduledNotifications = UIApplication.shared.scheduledLocalNotifications ?? []
	}
	
	open static let defaultCenter = LocalNotificationCenter()
	
}

public extension LocalNotificationCenter {
	
	public func getAllNotifications() -> [UILocalNotification] {
		
		return self.scheduledNotifications
		
	}
	
	public func getNotifications(inCategory category: String?) -> [UILocalNotification] {
		
		return self.scheduledNotifications.filter({ (notification) -> Bool in
			return notification.category == category
		})
		
	}
	
	public func removeAllNotifications() {
		
		self.scheduledNotifications.removeAll()
		
	}
	
	public func removeNotifications(inCategory category: String?) {
		
		self.scheduledNotifications = self.scheduledNotifications.filter({ (notification) -> Bool in
			notification.category != category
		})
		
	}
	
	public func scheduleNotification(_ notification: UILocalNotification) {
		
		self.scheduledNotifications.append(notification)
		
	}
	
	public func scheduleNotifications(_ notifications: [UILocalNotification]) {
		
		self.scheduledNotifications += notifications
		
	}
	
}
