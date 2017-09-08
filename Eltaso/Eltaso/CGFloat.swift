//
//  CGFloat.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CGFloat: EltasoCompatible {
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public static func makeRandom(within range: Range<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		return Containee.makeRandom(within: range)
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public static func negate(_ target: inout Containee) {
		target.negate()
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public func limited(within range: ClosedRange<Containee>) -> Containee {
		return self.body.limited(within: range)
	}
	
	public static func limit(_ target: inout Containee, within range: ClosedRange<Containee>) {
		target.limit(within: range)
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public var radianValue: Containee {
		return self.body.radianValue
	}
	
	public var degreeValue: Containee {
		return self.body.degreeValue
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public func vector(atAngle angle: Containee) -> CGVector {
		return self.body.vector(atAngle: angle)
	}
	
}

// MARK: - Internal methods
extension CGFloat {
	
	static func makeRandom(within range: Range<CGFloat>) -> CGFloat {
		
		let ratio = range.width / CGFloat(UInt32.max)
		let random = CGFloat(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	static func makeRandom(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		let ratio = range.width / CGFloat(UInt32.max.decreased)
		let random = CGFloat(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension CGFloat {
	
	var negated: CGFloat {
		return -self
	}
	
	mutating func negate() {
		self = self.negated
	}
	
}

extension CGFloat {
	
	func limited(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	mutating func limit(within range: ClosedRange<CGFloat>) {
		self = self.limited(within: range)
	}
	
}

extension CGFloat {
	
	var radianValue: CGFloat {
		
		return self / 180 * .pi
		
	}
	
	var degreeValue: CGFloat {
		
		return self * 180 / .pi
		
	}
	
}

extension CGFloat {
	
	func vector(atAngle angle: CGFloat) -> CGVector {
		
		let dx = self * cos(angle)
		let dy = self * sin(angle)
		return CGVector(dx: dx, dy: dy)
		
	}
	
}
