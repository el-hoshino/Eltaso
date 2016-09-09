//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Int {
	
	public static func createRandom(range: CountableRange<Int>) -> Int {
		
		let rangeLength = range.upperBound - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		
		return Int(random) + range.lowerBound
		
	}
	
	public static func createRandom(range: CountableClosedRange<Int>) -> Int {
		
		let rangeLength = range.upperBound.increased - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		
		return Int(random) + range.lowerBound
		
	}
	
}
