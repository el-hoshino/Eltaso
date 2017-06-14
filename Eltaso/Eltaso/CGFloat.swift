//
//  CGFloat.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGFloat: EltasoCompatible { }

extension EltasoContainer where Containee == CGFloat {
	
	public static func makeRndom(within range: Range<Containee>) -> Containee {
		
		let ratio = range.eltaso.width / Containee(UInt32.max)
		let random = Containee(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<Containee>) -> Containee {
		
		let ratio = range.eltaso.width / Containee(UInt32.max.decreased)
		let random = Containee(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public var negated: Containee {
		return -self.body
	}
	
	public static func negate(_ target: inout Containee) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
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

extension EltasoContainer where Containee == CGFloat {
	
	public var radianValue: Containee {
		
		return self.body / 180 * .pi
		
	}
	
	public var degreeValue: Containee {
		
		return self.body * 180 / .pi
		
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public func vector(atAngle angle: Containee) -> CGVector {
		
		let dx = self.body * cos(angle)
		let dy = self.body * sin(angle)
		return CGVector(dx: dx, dy: dy)
		
	}
	
}
