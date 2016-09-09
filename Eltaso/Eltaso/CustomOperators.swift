//
//  CustomOperators.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func + <Key, Value> (lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
	var dictionary = lhs
	rhs.forEach { (key, value) in
		dictionary[key] = value
	}
	return dictionary
}

public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func *= (lhs: inout CGSize, rhs: CGFloat) {
	lhs = lhs * rhs
}

public func *= (lhs: inout CGPoint, rhs: CGFloat) {
	lhs = lhs * rhs
}

public func += (lhs: inout CGPoint, rhs: CGPoint) {
	lhs = lhs + rhs
}

infix operator =? : AssignmentPrecedence

infix operator …= : ComparisonPrecedence

infix operator !…= : ComparisonPrecedence

public func =? <T> (lhs: inout T, rhs: T?) {
	if let rhs = rhs {
		lhs = rhs
	}
}

public func …= <T> (lhs: Range<T>, rhs: Range<T>) -> Bool where T: Comparable {
	if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T> (lhs: ClosedRange<T>, rhs: ClosedRange<T>) -> Bool where T: Comparable {
	if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T> (lhs: CountableRange<T>, rhs: CountableRange<T>) -> Bool where T: Comparable {
	if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T> (lhs: T, rhs: Range<T>) -> Bool where T: Comparable {
	if lhs >= rhs.lowerBound && lhs < rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T> (lhs: T, rhs: ClosedRange<T>) -> Bool where T: Comparable {
	if lhs >= rhs.lowerBound && lhs <= rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T> (lhs: T, rhs: CountableRange<T>) -> Bool where T: Comparable {
	if lhs >= rhs.lowerBound && lhs < rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func !…= <T> (lhs: Range<T>, rhs: Range<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}

public func !…= <T> (lhs: ClosedRange<T>, rhs: ClosedRange<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}

public func !…= <T> (lhs: CountableRange<T>, rhs: CountableRange<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}

public func !…= <T> (lhs: T, rhs: Range<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}

public func !…= <T> (lhs: T, rhs: ClosedRange<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}

public func !…= <T> (lhs: T, rhs: CountableRange<T>) -> Bool where T: Comparable {
	return !(lhs …= rhs)
}
