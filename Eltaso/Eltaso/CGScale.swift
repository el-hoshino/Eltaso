//
//  CGScale.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/10.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public struct CGScale {
	
	public var horizontal: CGFloat
	
	public var vertical: CGFloat
	
}

extension CGScale {
	
	public init() {
		self.horizontal = 0
		self.vertical = 0
	}
	
	public static let zero: CGScale = CGScale()
	
	public static let identity = CGScale(horizontal: 1, vertical: 1)
	
}


public func * (lhs: CGPoint, rhs: CGScale) -> CGPoint {
	return CGPoint(x: lhs.x * rhs.horizontal, y: lhs.y * rhs.vertical)
}

public func *= (lhs: inout CGPoint, rhs: CGScale) {
	lhs = lhs * rhs
}

public func / (lhs: CGPoint, rhs: CGPoint) -> CGScale {
	return CGScale(horizontal: lhs.x / rhs.x, vertical: lhs.y / rhs.y)
}


public func * (lhs: CGSize, rhs: CGScale) -> CGSize {
	return CGSize(width: lhs.width * rhs.horizontal, height: lhs.height * rhs.vertical)
}

public func *= (lhs: inout CGSize, rhs: CGScale) {
	lhs = lhs * rhs
}

public func / (lhs: CGSize, rhs: CGSize) -> CGScale {
	return CGScale(horizontal: lhs.width / rhs.width, vertical: lhs.height / rhs.height)
}
