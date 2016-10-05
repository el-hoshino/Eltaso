//
//  CGPoint.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func += (lhs: inout CGPoint, rhs: CGPoint) {
	lhs = lhs + rhs
}


public func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func *= (lhs: inout CGPoint, rhs: CGFloat) {
	lhs = lhs * rhs
}

