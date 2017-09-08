//
//  ClosedRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension ClosedRange {
	
	public static func …= (lhs: Bound, rhs: ClosedRange) -> Bool {
		if lhs >= rhs.lowerBound && lhs <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func …= (lhs: ClosedRange, rhs: ClosedRange) -> Bool {
		if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func !…= (lhs: ClosedRange, rhs: ClosedRange) -> Bool {
		return !(lhs …= rhs)
	}
	
	public static func !…= (lhs: Bound, rhs: ClosedRange) -> Bool {
		return !(lhs …= rhs)
	}
	
}

extension ClosedRange {
	
	public static func * (lhs: ClosedRange, rhs: ClosedRange) -> ClosedRange? {
		
		let lowerBound = max(lhs.lowerBound, rhs.lowerBound)
		let upperBound = min(lhs.upperBound, rhs.upperBound)
		
		guard lowerBound <= upperBound else {
			return nil
		}
		
		return lowerBound ... upperBound
		
	}
	
}

extension ClosedRange: EltasoCompatible {
	
	public var eltaso: Eltaso1AssociatedTypeContainer<ClosedRange<Bound>, Bound> {
		return Eltaso1AssociatedTypeContainer(body: self)
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == ClosedRange<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.width
	}
	
	public func offset(by n: AssociatedType.Stride) -> ClosedRange<AssociatedType> {
		return self.body.offset(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> ClosedRange<AssociatedType> {
		return self.body.appendingUpperBound(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> ClosedRange<AssociatedType> {
		return self.body.appendingLowerBound(by: n)
	}
	
}

// MARK: - Internal methods
extension ClosedRange where Bound: Strideable {
	
	var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	func offset(by n: Bound.Stride) -> ClosedRange {
		return self.lowerBound.advanced(by: n) ... self.upperBound.advanced(by: n)
	}
	
	func appendingUpperBound(by n: Bound.Stride) -> ClosedRange {
		return self.lowerBound ... self.upperBound.increased(by: n)
	}
	
	func appendingLowerBound(by n: Bound.Stride) -> ClosedRange {
		return self.lowerBound.decreased(by: n) ... self.upperBound
	}
	
}
