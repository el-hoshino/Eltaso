//
//  ArithmeticOperatable.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/04.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public protocol AdditionOperatable {
	static func + (lhs: Self, rhs: Self) -> Self
	static func += ( lhs: inout Self, rhs: Self)
	static var additionOperationInitialValue: Self { get }
}

public protocol SubtractionOperatable {
	static func - (lhs: Self, rhs: Self) -> Self
	static func -= ( lhs: inout Self, rhs: Self)
	static var substractionOperationInitialValue: Self { get }
}

public protocol MultiplicationOperatable {
	static func * (lhs: Self, rhs: Self) -> Self
	static func *= ( lhs: inout Self, rhs: Self)
	static var multiplicationOperationInitialValue: Self { get }
}

public protocol DivisionOperatable {
	static func / (lhs: Self, rhs: Self) -> Self
	static func /= ( lhs: inout Self, rhs: Self)
	static var divisionOperationInitialValue: Self { get }
}

extension Int:	AdditionOperatable {
	public static var additionOperationInitialValue: Int {
		return 0
	}
}

extension Int: SubtractionOperatable {
	public static var substractionOperationInitialValue: Int {
		return 0
	}
}

extension Int: MultiplicationOperatable {
	public static var multiplicationOperationInitialValue: Int {
		return 1
	}
}

extension Int: DivisionOperatable {
	public static var divisionOperationInitialValue: Int {
		return 1
	}
}
