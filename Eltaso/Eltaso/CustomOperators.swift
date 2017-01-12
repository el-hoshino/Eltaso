//
//  CustomOperators.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation


infix operator =? : AssignmentPrecedence

public func =? <T> (lhs: inout T, rhs: T?) {
	if let rhs = rhs {
		lhs = rhs
	}
}


infix operator …= : ComparisonPrecedence
infix operator !…= : ComparisonPrecedence

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

public func …= <T> (lhs: CountableClosedRange<T>, rhs: CountableClosedRange<T>) -> Bool where T: Comparable {
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

public func …= <T> (lhs: T, rhs: CountableClosedRange<T>) -> Bool where T: Comparable {
	if lhs >= rhs.lowerBound && lhs <= rhs.upperBound {
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

precedencegroup ExponentiationPrecedence {
	associativity: left
	higherThan: MultiplicationPrecedence
}

infix operator ^ : ExponentiationPrecedence

public func ^ <T> (lhs: Range<T>, rhs: Range<T>) -> Range<T>? where T: Comparable {
	
	let lowerBound = max(lhs.lowerBound, rhs.lowerBound)
	let upperBound = min(lhs.upperBound, rhs.upperBound)
	
	guard lowerBound <= upperBound else {
		return nil
	}
	
	return lowerBound ..< upperBound
	
}

public func ^ <T> (lhs: ClosedRange<T>, rhs: ClosedRange<T>) -> ClosedRange<T>? where T: Comparable {
	
	let lowerBound = max(lhs.lowerBound, rhs.lowerBound)
	let upperBound = min(lhs.upperBound, rhs.upperBound)
	
	guard lowerBound <= upperBound else {
		return nil
	}
	
	return lowerBound ... upperBound
	
}

