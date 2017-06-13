//
//  TimeInterval.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension EltasoContainer where Containee == TimeInterval {
	
	public static let minuteLength: Containee = 60
	public static let hourLength: Containee = EltasoContainer<Containee>.minuteLength * 60
	public static let dayLength: Containee = EltasoContainer<Containee>.hourLength * 24
	public static let weekLength: Containee = EltasoContainer<Containee>.dayLength * 7
	
}

extension EltasoContainer where Containee == TimeInterval {
	
	public var timeFormattedDescription: String {
		
		var seconds = Int(self.body)
		
		var minutes = seconds / 60
		seconds %= 60
		
		var hours = minutes / 60
		minutes %= 60
		
		let days = hours / 24
		hours %= 24
		
		if days > 0 {
			return "\(days) 日 \(hours) 時間 \(minutes) 分 \(seconds) 秒"
			
		} else if hours > 0 {
			return "\(hours) 時間 \(minutes) 分 \(seconds) 秒"
			
		} else if minutes > 0 {
			return "\(minutes) 分 \(seconds) 秒"
			
		} else {
			return "\(seconds) 秒"
		}
		
	}
	
}
