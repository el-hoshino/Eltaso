//
//  Numeric.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/09/07.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import Foundation

extension Numeric where Self: Comparable {
	
	public static func ± (lhs: Self, rhs: Self) -> ClosedRange<Self> {
		let added = lhs + rhs
		let subtracted = lhs - rhs
		let lowerBound = min(added, subtracted)
		let upperBound = max(added, subtracted)
		return lowerBound ... upperBound
	}
	
}
