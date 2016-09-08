//
//  NSDate.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Date {
	
	public static func getDateAtSpecificTime(hour: Int = 0, minute: Int = 0, second: Int = 0) throws -> Date {
		
		enum Error: ErrorProtocol {
			case failedToGetSpecificDateFromCurrentDate
		}
		
		let currentDate = Date()
		let currentCalendar = Calendar.current
		let dateComponents = (currentCalendar as NSCalendar).components([.year, .month, .day], from: currentDate)
		dateComponents.hour = hour
		dateComponents.minute = minute
		dateComponents.second = second
		
		guard let thisTime = currentCalendar.date(from: dateComponents) else {
			throw Error.failedToGetSpecificDateFromCurrentDate
		}
		
		return thisTime
		
	}
	
	public func getDateByAddingInterval(_ interval: Int, toUnit unit: NSCalendar.Unit) throws -> Date {
		
		enum Error: ErrorProtocol {
			case failedToGetEdittedDateFromCurrentDate
		}
		
		let calendar = Calendar.current
		guard let date = (calendar as NSCalendar).date(byAdding: unit, value: interval, to: self, options: []) else {
			throw Error.failedToGetEdittedDateFromCurrentDate
		}
		return date
		
	}
	
	public func getDateComponents(inTimeZone timeZone: TimeZone = .current()) -> DateComponents {
		
		let calendar = Calendar.current
		let components = calendar.dateComponents(in: timeZone, from: self)
		return components
		
	}
	
}
