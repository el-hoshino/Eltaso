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
	
	public static func makeRndom(within range: Range<CGFloat>) -> CGFloat {
		
		let ratio = range.width / CGFloat(UInt32.max)
		let random = CGFloat(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
	public static func makeRandom(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		let ratio = range.width / CGFloat(UInt32.max.decreased)
		let random = CGFloat(arc4random_uniform(.max)) * ratio
		
		return random + range.lowerBound
		
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public var negated: CGFloat {
		return -self.body
	}
	
	public static func negate(_ target: inout CGFloat) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public func limited(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		switch self.body {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self.body
		}
		
	}
	
	public static func limit(_ target: inout CGFloat, within range: ClosedRange<CGFloat>) {
		target = target.eltaso.limited(within: range)
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public var radianValue: CGFloat {
		
		return self.body / 180 * .pi
		
	}
	
	public var degreeValue: CGFloat {
		
		return self.body * 180 / .pi
		
	}
	
}

extension EltasoContainer where Containee == CGFloat {
	
	public func vector(atAngle angle: CGFloat) -> CGVector {
		
		let dx = self.body * cos(angle)
		let dy = self.body * sin(angle)
		return CGVector(dx: dx, dy: dy)
		
	}
	
}
