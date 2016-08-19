//
//  NSDate.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension NSDate {
	
	public static func getDateAtSpecificTime(hour hour: Int = 0, minute: Int = 0, second: Int = 0) throws -> NSDate {
		
		enum Error: ErrorType {
			case FailedToGetSpecificDateFromCurrentDate
		}
		
		let currentDate = NSDate()
		let currentCalendar = NSCalendar.currentCalendar()
		let dateComponents = currentCalendar.components([.Year, .Month, .Day], fromDate: currentDate)
		dateComponents.hour = hour
		dateComponents.minute = minute
		dateComponents.second = second
		
		guard let thisTime = currentCalendar.dateFromComponents(dateComponents) else {
			throw Error.FailedToGetSpecificDateFromCurrentDate
		}
		
		return thisTime
		
	}
	
	public func getDateByAddingInterval(interval: Int, toUnit unit: NSCalendarUnit) throws -> NSDate {
		
		enum Error: ErrorType {
			case FailedToGetEdittedDateFromCurrentDate
		}
		
		let calendar = NSCalendar.currentCalendar()
		guard let date = calendar.dateByAddingUnit(unit, value: interval, toDate: self, options: []) else {
			throw Error.FailedToGetEdittedDateFromCurrentDate
		}
		return date
		
	}
	
	public func getDateComponents(inTimeZone timeZone: NSTimeZone = .defaultTimeZone()) -> NSDateComponents {
		
		let calendar = NSCalendar.currentCalendar()
		let components = calendar.componentsInTimeZone(timeZone, fromDate: self)
		return components
		
	}
	
}
