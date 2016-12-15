//
//  Float.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Float {
	
	public static func createRndom(within range: Range<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max)
		let random = Float(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func createRandom(within range: ClosedRange<Float>) -> Float {
		
		let ratio = range.width / Float(UInt32.max)
		let random = Float(arc4random()) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension Float {
	
	public var inverted: Float {
		return -self
	}
	
	public mutating func invert() {
		self = self.inverted
	}
	
}

extension Float {
	
	public func limited(within range: ClosedRange<Float>) -> Float {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	public mutating func limit(within range: ClosedRange<Float>) {
		self = self.limited(within: range)
	}
	
}

extension Float {
	
	public var radianValue: Float {
		
		return self / 180 * .pi
		
	}
	
}
