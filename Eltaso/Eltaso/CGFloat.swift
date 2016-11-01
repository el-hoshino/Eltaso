//
//  CGFloat.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGFloat {
	
	public func limited(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
	public mutating func limit(within range: ClosedRange<CGFloat>) {
		self = self.limited(within: range)
	}
	
}