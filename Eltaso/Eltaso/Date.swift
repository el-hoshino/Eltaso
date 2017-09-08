//
//  Date.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Date: EltasoCompatible {
	
}

extension EltasoContainer where Containee == Date {
	
	public enum DateGenerationError: Error {
		case failedToGetSpecificDateFromCurrentDate
		case failedToGetEdittedDateFromCurrentDate
	}
	
	public static func getDateAtSpecificTime(hour: Int = 0, minute: Int = 0, second: Int = 0) throws -> Containee {
		return try Containee.getDateAtSpecificTime(hour: hour, minute: minute, second: second)
	}
	
	public func getDateByAddingInterval(_ interval: Int, toUnit unit: Calendar.Component) throws -> Containee {
		return try self.getDateByAddingInterval(interval, toUnit: unit)
	}
	
}

extension EltasoContainer where Containee == Date {
	
	public func getDateComponents(inTimeZone timeZone: TimeZone = .current) -> DateComponents {
		return self.body.getDateComponents(inTimeZone: timeZone)
	}
	
}

extension EltasoContainer where Containee == Date {
	
	public var elapsedTime: TimeInterval {
		return self.body.elapsedTime
	}
	
	public func elapsedTime(until date: Containee) -> TimeInterval {
		return self.body.elapsedTime(until: date)
	}
	
}

// MARK: - Internal methods
extension Date {
	
	static func getDateAtSpecificTime(hour: Int = 0, minute: Int = 0, second: Int = 0) throws -> Date {
		
		let currentDate = Date()
		let currentCalendar = Calendar.current
		var dateComponents = currentCalendar.dateComponents([.year, .month, .day], from: currentDate)
		dateComponents.hour = hour
		dateComponents.minute = minute
		dateComponents.second = second
		
		guard let specifiedTime = currentCalendar.date(from: dateComponents) else {
			throw EltasoContainer<Date>.DateGenerationError.failedToGetSpecificDateFromCurrentDate
		}
		
		return specifiedTime
		
	}
	
	func getDateByAddingInterval(_ interval: Int, toUnit unit: Calendar.Component) throws -> Date {
		
		let calendar = Calendar.current
		guard let date = calendar.date(byAdding: unit, value: interval, to: self) else {
			throw EltasoContainer<Date>.DateGenerationError.failedToGetEdittedDateFromCurrentDate
		}
		
		return date
		
	}
	
}

extension Date {
	
	func getDateComponents(inTimeZone timeZone: TimeZone = .current) -> DateComponents {
		
		let calendar = Calendar.current
		let components = calendar.dateComponents(in: timeZone, from: self)
		
		return components
		
	}
	
}

extension Date {
	
	var elapsedTime: TimeInterval {
		
		return -self.timeIntervalSinceNow
		
	}
	
	func elapsedTime(until date: Date) -> TimeInterval {
		
		return -self.timeIntervalSince(date)
		
	}
	
}
