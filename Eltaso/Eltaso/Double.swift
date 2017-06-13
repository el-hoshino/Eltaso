//
//  Double.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Double: EltasoCompatible { }

extension EltasoContainer where Containee == Double {
	
	public static func makeRndom(within range: Range<Containee>) -> Containee {
		
		let ratio = range.width / Containee(UInt32.max)
		let random = Containee(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		
		let ratio = range.width / Containee(UInt32.max.decreased)
		let random = Containee(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public var negated: Containee {
		return -self.body
	}
	
	public static func negate(_ target: inout Containee) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		
		switch self.body {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self.body
		}
		
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target = target.eltaso.limited(within: range)
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public var radianValue: Containee {
		
		if #available(iOS 10.0, *) {
			let degreeMeasurement = Measurement(value: self.body, unit: UnitAngle.degrees)
			let radianMeasurement = degreeMeasurement.converted(to: .radians)
			return radianMeasurement.value
			
		} else {
			return self.body / 180 * .pi
			
		}
		
	}
	
}
