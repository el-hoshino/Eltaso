//
//  Float.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Float: EltasoCompatible {
	
}

extension EltasoContainer where Containee == Float {
	
	public static func makeRandom(within range: Range<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public static func nagate(_ target: inout Containee) {
		target.negate()
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target.limit(within: range)
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public var radianValue: Containee {
		return self.body.radianValue
	}
	
}

// MARK: - Internal methods
extension Float {
	
	static func makeRandom(within range: Range<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max)
		let random = Float(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	static func makeRandom(within range: ClosedRange<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max.decreased)
		let random = Float(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension Float {
	
	var negated: Float {
		return -self
	}
	
	mutating func nagate() {
		self = self.negated
	}
	
}

extension Float {
	
	func limited(within range: ClosedRange<Float>) -> Float {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	mutating func limit(within range: ClosedRange<Float>) {
		self = self.limited(within: range)
	}
	
}

extension Float {
	
	var radianValue: Float {
		
		return self / 180 * .pi
		
	}
	
}
