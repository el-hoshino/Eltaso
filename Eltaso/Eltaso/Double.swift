//
//  Double.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation


// MARK: - Public methods
extension Double: EltasoCompatible {
	
	public var eltaso: EltasoContainer<Double> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public static func makeRandom(within range: Range<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public static func negate(_ target: inout Containee) {
		target.negate()
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target.limit(within: range)
	}
	
}

extension EltasoContainer where Containee == Double {
	
	public var radianValue: Containee {
		return self.body.radianValue
	}
	
}

// MARK: - Internal methods
extension Double {
	
	static func makeRandom(within range: Range<Double>) -> Double {
		
		let ratio = range.width / Double(UInt32.max)
		let random = Double(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	static func makeRandom(within range: ClosedRange<Double>) -> Double {
		
		let ratio = range.width / Double(UInt32.max.decreased)
		let random = Double(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension Double {
	
	var negated: Double {
		return -self
	}
	
	mutating func negate() {
		self = self.negated
	}
	
}

extension Double {
	
	func limited(within range: ClosedRange<Double>) -> Double {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	mutating func limit(within range: ClosedRange<Double>) {
		self = self.limited(within: range)
	}
	
}

extension Double {
	
	var radianValue: Double {
		
		if #available(iOS 10.0, *) {
			let degreeMeasurement = Measurement(value: self, unit: UnitAngle.degrees)
			let radianMeasurement = degreeMeasurement.converted(to: .radians)
			return radianMeasurement.value
			
		} else {
			return self / 180 * .pi
			
		}
		
	}
	
}
