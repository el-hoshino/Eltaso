//
//  CustomOperators.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

infix operator =? {
	associativity none
	precedence 130
}

infix operator …= {
	associativity none
	precedence 130
}

func =? <T> (inout lhs: T, rhs: T?) {
	if let rhs = rhs {
		lhs = rhs
	}
}

func …= <T where T: Comparable> (lhs: Range<T>, rhs: Range<T>) -> Bool {
	if lhs.startIndex >= rhs.startIndex && lhs.endIndex <= rhs.endIndex {
		return true
	} else {
		return false
	}
}

func …= <T where T: Comparable> (lhs: HalfOpenInterval<T>, rhs: HalfOpenInterval<T>) -> Bool {
	if lhs.start >= rhs.start && lhs.end <= rhs.end {
		return true
	} else {
		return false
	}
}

func …= <T where T: Comparable> (lhs: ClosedInterval<T>, rhs: ClosedInterval<T>) -> Bool {
	if lhs.start >= rhs.start && lhs.end <= rhs.end {
		return true
	} else {
		return false
	}
}

func …= <T where T: Comparable> (lhs: T, rhs: Range<T>) -> Bool {
	if lhs >= rhs.startIndex && lhs < rhs.endIndex {
		return true
	} else {
		return false
	}
}

func …= <T where T: Comparable> (lhs: T, rhs: HalfOpenInterval<T>) -> Bool {
	if lhs >= rhs.start && lhs < rhs.end {
		return true
	} else {
		return false
	}
}

func …= <T where T: Comparable> (lhs: T, rhs: ClosedInterval<T>) -> Bool {
	if lhs >= rhs.start && lhs <= rhs.end {
		return true
	} else {
		return false
	}
}