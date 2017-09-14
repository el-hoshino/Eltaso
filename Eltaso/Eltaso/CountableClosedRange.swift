//
//  CountableClosedRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CountableClosedRange {
	
	public static func …= (lhs: Bound, rhs: CountableClosedRange) -> Bool {
		if lhs >= rhs.lowerBound && lhs <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func …= (lhs: CountableClosedRange, rhs: CountableClosedRange) -> Bool {
		if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func !…= (lhs: CountableClosedRange, rhs: CountableClosedRange) -> Bool {
		return !(lhs …= rhs)
	}
	
	public static func !…= (lhs: Bound, rhs: CountableClosedRange) -> Bool {
		return !(lhs …= rhs)
	}
	
}

extension CountableClosedRange: EltasoCompatible {
	
	public var eltaso: Eltaso1AssociatedTypeContainer<CountableClosedRange<Bound>, Bound> {
		return Eltaso1AssociatedTypeContainer(body: self)
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == CountableClosedRange<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.lowerBound.distance(to: self.body.upperBound)
	}
	
	public func offset(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: n) ... self.body.upperBound.advanced(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound ... self.body.upperBound.advanced(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: -n) ... self.body.upperBound
	}
	
}

// MARK: - Internal methods
extension CountableClosedRange where Bound: Strideable {
	
	var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	func offset(by n: Bound.Stride) -> CountableClosedRange {
		return self.lowerBound.advanced(by: n) ... self.upperBound.advanced(by: n)
	}
	
	func appendingUpperBound(by n: Bound.Stride) -> CountableClosedRange {
		return self.lowerBound ... self.upperBound.advanced(by: n)
	}
	
	func appendingLowerBound(by n: Bound.Stride) -> CountableClosedRange {
		return self.lowerBound.advanced(by: -n) ... self.upperBound
	}
	
}
