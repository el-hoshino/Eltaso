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
	rhs.forEach { (pair) in
		dictionary[pair.0] = pair.1
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

infix operator =? {
	associativity none
	precedence 130
}

infix operator …= {
	associativity none
	precedence 130
}

infix operator !…= {
	associativity none
	precedence 130
}

public func =? <T> (lhs: inout T, rhs: T?) {
	if let rhs = rhs {
		lhs = rhs
	}
}

public func …= <T where T: Comparable> (lhs: Range<T>, rhs: Range<T>) -> Bool {
	if lhs.lowerBound >= rhs.lowerBound && lhs.upperBound <= rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T where T: Comparable> (lhs: Range<T>, rhs: Range<T>) -> Bool {
	if lhs.start >= rhs.start && lhs.end <= rhs.end {
		return true
	} else {
		return false
	}
}

public func …= <T where T: Comparable> (lhs: ClosedRange<T>, rhs: ClosedRange<T>) -> Bool {
	if lhs.start >= rhs.start && lhs.end <= rhs.end {
		return true
	} else {
		return false
	}
}

public func …= <T where T: Comparable> (lhs: T, rhs: Range<T>) -> Bool {
	if lhs >= rhs.lowerBound && lhs < rhs.upperBound {
		return true
	} else {
		return false
	}
}

public func …= <T where T: Comparable> (lhs: T, rhs: Range<T>) -> Bool {
	if lhs >= rhs.start && lhs < rhs.end {
		return true
	} else {
		return false
	}
}

public func …= <T where T: Comparable> (lhs: T, rhs: ClosedRange<T>) -> Bool {
	if lhs >= rhs.start && lhs <= rhs.end {
		return true
	} else {
		return false
	}
}

public func !…= <T where T: Comparable> (lhs: Range<T>, rhs: Range<T>) -> Bool {
	return !(lhs …= rhs)
}

public func !…= <T where T: Comparable> (lhs: Range<T>, rhs: Range<T>) -> Bool {
	return !(lhs …= rhs)
}

public func !…= <T where T: Comparable> (lhs: ClosedRange<T>, rhs: ClosedRange<T>) -> Bool {
	return !(lhs …= rhs)
}

public func !…= <T where T: Comparable> (lhs: T, rhs: Range<T>) -> Bool {
	return !(lhs …= rhs)
}

public func !…= <T where T: Comparable> (lhs: T, rhs: Range<T>) -> Bool {
	return !(lhs …= rhs)
}

public func !…= <T where T: Comparable> (lhs: T, rhs: ClosedRange<T>) -> Bool {
	return !(lhs …= rhs)
}
