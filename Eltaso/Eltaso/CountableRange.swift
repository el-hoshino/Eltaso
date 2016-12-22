//
//  CountableRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CountableRange {
	
	public var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	public func offset(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound.advanced(by: n) ..< self.upperBound.advanced(by: n)
	}
	
	public func appendingUpperBound(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound ..< self.upperBound.advanced(by: n)
	}
	
	public func appendingLowerBound(by n: Bound.Stride) -> CountableRange {
		return self.lowerBound.advanced(by: -n) ..< self.upperBound
	}
	
}
