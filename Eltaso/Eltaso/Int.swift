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
	
	public static func makeRandom(within range: Range<Containee>) -> Containee {
		
		let random = arc4random_uniform(UInt32(range.eltaso.width))
		return Containee(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		
		let random = arc4random_uniform(UInt32(range.eltaso.width.increased))
		return Containee(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: CountableRange<Containee>) -> Containee {
		
		let random = arc4random_uniform(UInt32(range.eltaso.width))
		return Containee(random) + range.lowerBound
		
	}
	
	public static func makeRandom(within range: CountableClosedRange<Containee>) -> Containee {
		
		let random = arc4random_uniform(UInt32(range.eltaso.width.increased))
		return Containee(random) + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public var negated: Containee {
		return -self.body
	}
	
	public static func negate(_ target: inout Containee) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == Int {
	
	public func limited(within range: Range<Containee>) -> Containee {
		
		switch self.body {
		case Containee.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound.decreased ... Containee.max:
			return range.upperBound.decreased
			
		default:
			return self.body
		}
		
	}
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		
		switch self.body {
		case Containee.min ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... Containee.max:
			return range.upperBound
			
		default:
			return self.body
		}
		
	}
	
	public func limited(within range: CountableRange<Containee>) -> Containee {
		let range = Range(range)
		return self.limited(within: range)
	}
	
	public func limited(within range: CountableClosedRange<Containee>) -> Containee {
		let range = ClosedRange(range)
		return self.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: Range<Containee>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: CountableRange<Containee>) {
		target = target.eltaso.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: CountableClosedRange<Containee>) {
		target = target.eltaso.limited(within: range)
	}
	
}
