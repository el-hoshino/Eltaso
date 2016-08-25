//
//  Weekday.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/25.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public enum Weekday: Int {
	case Sunday = 1 // According to NSCalendar's weekday property
	case Monday
	case Tuesday
	case Wednesday
	case Thursday
	case Friday
	case Saturday
	
	public var japanese: String {
		switch self {
		case .Sunday:
			return "日"
			
		case .Monday:
			return "月"
			
		case .Tuesday:
			return "火"
			
		case .Wednesday:
			return "水"
			
		case .Thursday:
			return "木"
			
		case .Friday:
			return "金"
			
		case .Saturday:
			return "土"
		}
	}
	
	public static var all: [Weekday] {
		return [
			.Sunday,
			.Monday,
			.Tuesday,
			.Wednesday,
			.Thursday,
			.Friday,
			.Saturday,
		]
	}
	
}
