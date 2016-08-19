//
//  LocalNotificationCenter.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public class LocalNotificationCenter {
	
	private let application = UIApplication.sharedApplication()
	private var scheduledNotifications: [UILocalNotification] {
		didSet {
			self.scheduledNotifications = self.scheduledNotifications.filter({ (notification) -> Bool in
				guard let fireDate = notification.fireDate else {
					return false
				}
				return fireDate.timeIntervalSinceNow >= 0
			})
		}
	}
	
	private init() {
		self.scheduledNotifications = UIApplication.sharedApplication().scheduledLocalNotifications ?? []
	}
	
	public static let defaultCenter = LocalNotificationCenter()
	
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
		self.application.cancelAllLocalNotifications()
		
	}
	
	public func removeNotifications(inCategory category: String?) {
		
		self.scheduledNotifications = self.scheduledNotifications.filter({ (notification) -> Bool in
			notification.category != category
		})
		self.application.scheduledLocalNotifications = self.scheduledNotifications
		
	}
	
	public func scheduleNotification(notification: UILocalNotification) {
		
		self.scheduledNotifications.append(notification)
		self.application.scheduleLocalNotification(notification)
		
	}
	
	public func scheduleNotifications(notifications: [UILocalNotification]) {
		
		self.scheduledNotifications += notifications
		self.application.scheduledLocalNotifications = self.scheduledNotifications
		
	}
	
}
