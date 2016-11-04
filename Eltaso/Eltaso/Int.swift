//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Int {
	
	public static func createRandom(within range: Range<Int>) -> Int {
		
		let rangeLength = range.upperBound - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		
		return Int(random) + range.lowerBound
		
	}
	
	public static func createRandom(within range: ClosedRange<Int>) -> Int {
		
		let rangeLength = range.upperBound.increased - range.lowerBound
		let random = arc4random_uniform(UInt32(rangeLength))
		
		return Int(random) + range.lowerBound
		
	}
	
	public static func createRandom(within range: CountableRange<Int>) -> Int {
		let range = Range(range)
		return Int.createRandom(within: range)
	}
	
	public static func createRandom(within range: CountableClosedRange<Int>) -> Int {
		let range = ClosedRange(range)
		return Int.createRandom(within: range)
	}
	
}

extension Int {
	
	public var inverted: Int {
		return -self
	}
	
	public mutating func invert() {
		self = self.inverted
	}
	
}

extension Int {
	
	public func limited(within range: Range<Int>) -> Int {
		
		switch self {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound.decreased ... Int.max:
			return range.upperBound.decreased
			
		default:
			return self
		}
		
	}
	
	public func limited(within range: ClosedRange<Int>) -> Int {
		
		switch self {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... Int.max:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	public func limited(within range: CountableRange<Int>) -> Int {
		let range = Range(range)
		return self.limited(within: range)
	}
	
	public func limited(within range: CountableClosedRange<Int>) -> Int {
		let range = ClosedRange(range)
		return self.limited(within: range)
	}
	
	public mutating func limit(within range: Range<Int>) {
		self = self.limited(within: range)
	}
	
	public mutating func limit(within range: ClosedRange<Int>) {
		self = self.limited(within: range)
	}
	
	public mutating func limit(within range: CountableRange<Int>) {
		self = self.limited(within: range)
	}
	
	public mutating func limit(within range: CountableClosedRange<Int>) {
		self = self.limited(within: range)
	}
	
}
