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

extension CGPoint {
	
	public init(point: CGFloat) {
		self.init(x: point, y: point)
	}
	
}

extension CGPoint {
	
	public var verticalInverted: CGPoint {
		return CGPoint(x: self.x, y: -self.y)
	}
	
	public func anchorPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.x / size.width, y: self.y / size.height)
	}
	
	public func realPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.x * size.width, y: self.y * size.height)
	}
	
}
