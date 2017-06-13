//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Int: EltasoCompatible { }

extension EltasoContainer where Containee == Int {
	
	public static func makeRandom(within range: Range<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width))
		return Int(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width.increased))
		return Int(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: CountableRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width))
		return Int(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: CountableClosedRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width.increased))
		return Int(random) + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public var negated: Int {
		return -self.body
	}
	
	public static func negate(_ target: inout Int) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public func limited(within range: Range<Int>) -> Int {
		
		switch self.body {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound.decreased ... Int.max:
			return range.upperBound.decreased
			
		default:
			return self.body
		}
		
	}
	
	public func limited(within range: ClosedRange<Int>) -> Int {
		
		switch self.body {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... Int.max:
			return range.upperBound
			
		default:
			return self.body
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
	
	public static func limit(_ target: inout Int, within range: Range<Int>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Int, within range: ClosedRange<Int>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Int, within range: CountableRange<Int>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Int, within range: CountableClosedRange<Int>) {
		target = target.eltaso.limited(within: range)
	}
	
}
