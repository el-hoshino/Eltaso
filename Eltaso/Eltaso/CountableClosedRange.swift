//
//  CountableClosedRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CountableClosedRange {
	
	public var width: Bound.Stride {
		return self.lowerBound.distance(to: self.upperBound)
	}
	
}
