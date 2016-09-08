//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Int {
	
	public static func createRandom(range: Range<Int>) -> Int {
		let rangeLength = range.upperBound - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		return Int(random) + range.lowerBound
	}
	
}
