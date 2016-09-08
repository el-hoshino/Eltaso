//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Int {
	
	var increased: Int {
		return self + 1
	}
	
	var decreased: Int {
		return self - 1
	}
	
	func increased(by n: Int) -> Int {
		return self + n
	}
	
	func decreased(by n: Int) -> Int {
		return self - n
	}
	
	mutating func increase(by n: Int = 1) {
		self = self.increased(by: n)
	}
	
	mutating func decrease(by n: Int = 1) {
		self = self.decreased(by: n)
	}
	
	public static func createRandom(range: Range<Int>) -> Int {
		let rangeLength = range.upperBound - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		return Int(random) + range.lowerBound
	}
	
	public static func createRandom(range: ClosedRange<Int>) -> Int {
		let rangeLength = range.upperBound.increased - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		return Int(random) + range.lowerBound
	}
	
}
