//
//  Float.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Float: EltasoCompatible { }

extension EltasoContainer where Containee == Float {
	
	public static func makeRndom(within range: Range<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max)
		let random = Float(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max.decreased)
		let random = Float(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public var negated: Float {
		return -self.body
	}
	
	public static func nagate(_ target: inout Float) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public func limited(within range: ClosedRange<Float>) -> Float {
		
		switch self.body {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self.body
		}
		
	}
	
	public static func limit(_ target: inout Float, within range: ClosedRange<Float>) {
		target = target.eltaso.limited(within: range)
	}
	
}

extension EltasoContainer where Containee == Float {
	
	public var radianValue: Float {
		
		return self.body / 180 * .pi
		
	}
	
}
