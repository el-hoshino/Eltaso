//
//  Double.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Double {
	
	public static func createRndom(within range: Range<Double>) -> Double {
		
		let ratio = range.width / Double(UInt32.max)
		let random = Double(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func createRandom(within range: ClosedRange<Double>) -> Double {
		
		let ratio = range.width / Double(UInt32.max.decreased)
		let random = Double(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension Double {
	
	public var inverted: Double {
		return -self
	}
	
	public mutating func invert() {
		self = self.inverted
	}
	
}

extension Double {
	
	public func limited(within range: ClosedRange<Double>) -> Double {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	public mutating func limit(within range: ClosedRange<Double>) {
		self = self.limited(within: range)
	}
	
}

extension Double {
	
	public var radianValue: Double {
		
		if #available(iOS 10.0, *) {
			let degreeMeasurement = Measurement(value: self, unit: UnitAngle.degrees)
			let radianMeasurement = degreeMeasurement.converted(to: .radians)
			return radianMeasurement.value
			
		} else {
			return self / 180 * .pi
			
		}
		
	}
	
}
