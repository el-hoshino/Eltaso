//
//  CountableRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CountableRange {
	
	public static func …= (lhs: Bound, rhs: CountableRange) -> Bool {
		if lhs >= rhs.lowerBound && lhs < rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func …= (lhs: CountableRange, rhs: CountableRange) -> Bool {
		if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func !…= (lhs: CountableRange, rhs: CountableRange) -> Bool {
		return !(lhs …= rhs)
	}
	
	public static func !…= (lhs: Bound, rhs: CountableRange) -> Bool {
		return !(lhs …= rhs)
	}
	
}

extension CountableRange: EltasoCompatible {
	
}

extension Eltaso1AssociatedTypeContainer where Containee == CountableRange<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.width
	}
	
	public func offset(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.offset(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.appendingUpperBound(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.appendingLowerBound(by: n)
	}
	
}

// MARK: - Internal methods
extension CountableRange where Bound: Strideable {
	
	var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	func offset(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound.advanced(by: n) ..< self.upperBound.advanced(by: n)
	}
	
	func appendingUpperBound(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound ..< self.upperBound.advanced(by: n)
	}
	
	func appendingLowerBound(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound.advanced(by: -n) ..< self.upperBound
	}
	
}
