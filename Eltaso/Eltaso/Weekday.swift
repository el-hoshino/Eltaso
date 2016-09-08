//
//  Weekday.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/25.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public enum Weekday: Int {
	case sunday = 1 // According to NSCalendar's weekday property
	case monday
	case tuesday
	case wednesday
	case thursday
	case friday
	case saturday
	
	public var japanese: String {
		switch self {
		case .sunday:
			return "日"
			
		case .monday:
			return "月"
			
		case .tuesday:
			return "火"
			
		case .wednesday:
			return "水"
			
		case .thursday:
			return "木"
			
		case .friday:
			return "金"
			
		case .saturday:
			return "土"
		}
	}
	
	public static var all: [Weekday] {
		return [
			.sunday,
			.monday,
			.tuesday,
			.wednesday,
			.thursday,
			.friday,
			.saturday,
		]
	}
	
}
