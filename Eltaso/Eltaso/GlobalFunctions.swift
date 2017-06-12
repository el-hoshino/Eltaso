//
//  GlobalFunctions.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func cot(_ x: Double) -> Double {
	return 1 / tan(x)
}

public func stride <T> (_ range: Range<T>, by stride: T.Stride) -> StrideTo<T> {
	return Swift.stride(from: range.lowerBound, to: range.upperBound, by: stride)
}

public func stride <T> (_ range: ClosedRange<T>, by stride: T.Stride) -> StrideThrough<T> {
	return Swift.stride(from: range.lowerBound, through: range.upperBound, by: stride)
}
