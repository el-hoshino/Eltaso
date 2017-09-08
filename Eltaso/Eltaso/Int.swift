//
//  Int.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Int: EltasoCompatible {
	
}

extension EltasoContainer where Containee == Int {
	
	public static func makeRandom(within range: Range<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: CountableRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: CountableClosedRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public static func negate(_ target: inout Containee) {
		target.negate()
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public func limited(within range: Range<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public func limited(within range: CountableRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public func limited(within range: CountableClosedRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: Range<Containee>) {
		target.limit(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target.limit(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: CountableRange<Containee>) {
		target.limit(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: CountableClosedRange<Containee>) {
		target.limit(within: range)
	}
	
}

// MARK: - Internal methods
extension Int {
	
	static func makeRandom(within range: Range<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width))
		return Int(random) + range.lowerBound
		
	}
	
	static func makeRandom(within range: ClosedRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width.increased))
		return Int(random) + range.lowerBound
		
	}
	
	static func makeRandom(within range: CountableRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width))
		return Int(random) + range.lowerBound
		
	}
	
	static func makeRandom(within range: CountableClosedRange<Int>) -> Int {
		
		let random = arc4random_uniform(UInt32(range.width.increased))
		return Int(random) + range.lowerBound
		
	}
	
}

extension Int {
	
	var negated: Int {
		return -self
	}
	
	mutating func negate() {
		self = self.negated
	}
	
}

extension Int {
	
	func limited(within range: Range<Int>) -> Int {
		
		switch self {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound.decreased ... Int.max:
			return range.upperBound.decreased
			
		default:
			return self
		}
		
	}
	
	func limited(within range: ClosedRange<Int>) -> Int {
		
		switch self {
		case Int.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... Int.max:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	func limited(within range: CountableRange<Int>) -> Int {
		let range = Range(range)
		return self.limited(within: range)
	}
	
	func limited(within range: CountableClosedRange<Int>) -> Int {
		let range = ClosedRange(range)
		return self.limited(within: range)
	}
	
	mutating func limit(within range: Range<Int>) {
		self = self.limited(within: range)
	}
	
	mutating func limit(within range: ClosedRange<Int>) {
		self = self.limited(within: range)
	}
	
	mutating func limit(within range: CountableRange<Int>) {
		self = self.limited(within: range)
	}
	
	mutating func limit(within range: CountableClosedRange<Int>) {
		self = self.limited(within: range)
	}
	
}
