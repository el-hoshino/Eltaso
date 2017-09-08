//
//  Range.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Range {
	
	public static func …= (lhs: Bound, rhs: Range) -> Bool {
		if lhs >= rhs.lowerBound && lhs < rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func …= (lhs: Range, rhs: Range) -> Bool {
		if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
			return true
		} else {
			return false
		}
	}
	
	public static func !…= (lhs: Range, rhs: Range) -> Bool {
		return !(lhs …= rhs)
	}
	
	public static func !…= (lhs: Bound, rhs: Range) -> Bool {
		return !(lhs …= rhs)
	}
	
}

extension Range {
	
	public static func * (lhs: Range, rhs: Range) -> Range? {
		
		let lowerBound = max(lhs.lowerBound, rhs.lowerBound)
		let upperBound = min(lhs.upperBound, rhs.upperBound)
		
		guard lowerBound <= upperBound else {
			return nil
		}
		
		return lowerBound ..< upperBound
		
	}
	
}

extension Range: EltasoCompatible {
	
	public var eltaso: Eltaso1AssociatedTypeContainer<Range<Bound>, Bound> {
		return Eltaso1AssociatedTypeContainer(body: self)
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Range<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.width
	}
	
	public func offset(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.offset(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.appendingUpperBound(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.appendingLowerBound(by: n)
	}
	
}

// MARK: - Internal methods
extension Range where Bound: Strideable {
	
	var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	func offset(by n: Bound.Stride) -> Range {
		return self.lowerBound.increased(by: n) ..< self.upperBound.increased(by: n)
	}
	
	func appendingUpperBound(by n: Bound.Stride) -> Range {
		return self.lowerBound ..< self.upperBound.increased(by: n)
	}
	
	func appendingLowerBound(by n: Bound.Stride) -> Range {
		return self.lowerBound.decreased(by: n) ..< self.upperBound
	}
	
}
