//
//  Range.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Range where Bound: Strideable {
	
	public var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
	public func offset(by n: Bound.Stride) -> Range {
		return self.lowerBound.increased(by: n) ..< self.upperBound.increased(by: n)
	}
	
	public func appendingUpperBound(by n: Bound.Stride) -> Range {
		return self.lowerBound ..< self.upperBound.increased(by: n)
	}
	
	public func appendingLowerBound(by n: Bound.Stride) -> Range {
		return self.lowerBound.decreased(by: n) ..< self.upperBound
	}
	
}
