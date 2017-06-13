//
//  CGPoint.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGPoint {
	
	public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	}
	
	public static func += (lhs: inout CGPoint, rhs: CGPoint) {
		lhs = lhs + rhs
	}
	
	public static func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
		return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
	}
	
	public static func += (lhs: inout CGPoint, rhs: CGVector) {
		lhs = lhs + rhs
	}
	
	public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	}
	
	public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
		lhs = lhs - rhs
	}
	
	public static func - (lhs: CGPoint, rhs: CGVector) -> CGPoint {
		return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
	}
	
	public static func -= (lhs: inout CGPoint, rhs: CGVector) {
		lhs = lhs - rhs
	}
	
	public static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
		return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
	}
	
	public static func *= (lhs: inout CGPoint, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	public static func * (lhs: CGPoint, rhs: CGScale) -> CGPoint {
		return CGPoint(x: lhs.x * rhs.horizontal, y: lhs.y * rhs.vertical)
	}
	
	public static func *= (lhs: inout CGPoint, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
		return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
	}
	
	public static func /= (lhs: inout CGPoint, rhs: CGFloat) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGPoint, rhs: CGScale) -> CGPoint {
		return CGPoint(x: lhs.x / rhs.horizontal, y: lhs.y / rhs.vertical)
	}
	
	public static func /= (lhs: inout CGPoint, rhs: CGScale) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGPoint, rhs: CGPoint) -> CGScale {
		return CGScale(horizontal: lhs.x / rhs.x, vertical: lhs.y / rhs.y)
	}
	
}

extension CGPoint: EltasoCompatible { }

extension EltasoContainer where Containee == CGPoint {
	
	public enum Dimension {
		case horizontal
		case vertical
	}
	
	public struct DimensionSet: OptionSet {
		
		public typealias RawValue = UInt
		public let rawValue: RawValue
		public init(rawValue: CGPoint.Eltaso.DimensionSet.RawValue) {
			self.rawValue = rawValue
		}
		
		public static let horizontal = DimensionSet(rawValue: 1 << 0)
		public static let vertical = DimensionSet(rawValue: 1 << 1)
		
		public static let both: DimensionSet = [.horizontal, .vertical]
		
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public static func reflected(byAdding vector: CGVector, to point: CGPoint = .zero) -> CGPoint {
		return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
	}
	
	public static func reflected(bySubtracting vector: CGVector, from point: CGPoint) -> CGPoint {
		return CGPoint(x: point.x - vector.dx , y: point.y - vector.dy)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public static func `init`(point: CGFloat) -> CGPoint {
		return CGPoint(x: point, y: point)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func isIncluded(in rect: CGRect) -> Bool {
		return self.body.x …= rect.eltaso.horizontalRange
			&& self.body.y …= rect.eltaso.verticalRange
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public var negated: CGPoint {
		
		return self.negated(in: .both)
		
	}
	
	public func negated(in dimensions: DimensionSet) -> CGPoint {
		
		var negated = self.body
		
		if dimensions.contains(.horizontal) {
			negated.x.negate()
		}
		
		if dimensions.contains(.vertical) {
			negated.y.negate()
		}
		
		return negated
		
	}
	
	public static func negate(_ target: inout CGPoint, in dimensions: DimensionSet) {
		target = target.eltaso.negated(in: dimensions)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func convertedToOrigin(in size: CGSize) -> CGPoint {
		
		let halfSize = size / 2
		let origin = CGPoint(x: self.body.x - halfSize.width, y: self.body.y - halfSize.height)
		return origin
		
	}
	
	public func convertedToCenter(in size: CGSize) -> CGPoint {
		
		let halfSize = size / 2
		let center = CGPoint(x: self.body.x + halfSize.width, y: self.body.y + halfSize.height)
		return center
		
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func anchorPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.body.x / size.width, y: self.body.y / size.height)
	}
	
	public func realPoint(in size: CGSize) -> CGPoint {
		return CGPoint(x: self.body.x * size.width, y: self.body.y * size.height)
	}
	
}
