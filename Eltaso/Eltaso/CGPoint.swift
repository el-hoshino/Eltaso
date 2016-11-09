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

public func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func -= (lhs: inout CGPoint, rhs: CGPoint) {
	lhs = lhs - rhs
}

public func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func *= (lhs: inout CGPoint, rhs: CGFloat) {
	lhs = lhs * rhs
}

public func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
	return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

public func /= (lhs: inout CGPoint, rhs: CGFloat) {
	lhs = lhs / rhs
}

extension CGPoint {
	
	public init(point: CGFloat) {
		self.init(x: point, y: point)
	}
	
}

extension CGPoint {
	
	public struct DimensionSet: OptionSet {
		
		public typealias RawValue = UInt
		public let rawValue: RawValue
		public init(rawValue: CGPoint.DimensionSet.RawValue) {
			self.rawValue = rawValue
		}
		
		public static let horizontal = DimensionSet(rawValue: 1 << 0)
		public static let vertical = DimensionSet(rawValue: 1 << 1)
		
		public static let both: DimensionSet = [.horizontal, .vertical]
	
	}
	
	public func inverted(in dimensions: DimensionSet) -> CGPoint {
		
		var inverted = self
		
		if dimensions.contains(.horizontal) {
			inverted.x.invert()
		}
		
		if dimensions.contains(.vertical) {
			inverted.y.invert()
		}
		
		return inverted
		
	}
	
	public mutating func invert(in dimensions: DimensionSet) {
		self = self.inverted(in: dimensions)
	}
	
}

extension CGPoint {
	
	public func anchorPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.x / size.width, y: self.y / size.height)
	}
	
	public func realPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.x * size.width, y: self.y * size.height)
	}
	
}
