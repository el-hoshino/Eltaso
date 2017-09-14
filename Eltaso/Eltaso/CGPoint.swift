//
//  CGPoint.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
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

extension CGPoint: EltasoCompatible {
	
	public var eltaso: EltasoContainer<CGPoint> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public enum Dimension {
		case horizontal
		case vertical
	}
	
	public struct DimensionSet: OptionSet {
		
		public typealias RawValue = UInt
		public let rawValue: RawValue
		public init(rawValue: RawValue) {
			self.rawValue = rawValue
		}
		
		public static let horizontal = DimensionSet(rawValue: 1 << 0)
		public static let vertical = DimensionSet(rawValue: 1 << 1)
		
		public static let both: DimensionSet = [.horizontal, .vertical]
		
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public static func reflected(byAdding vector: CGVector, to point: Containee = .zero) -> Containee {
		return Containee.reflected(byAdding: vector, to: point)
	}
	
	public static func reflected(bySubtracting vector: CGVector, from point: Containee = .zero) -> Containee {
		return Containee.reflected(bySubtracting: vector, from: point)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public static func `init`(point: CGFloat) -> Containee {
		return Containee(point: point)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func isIncluded(in rect: CGRect) -> Bool {
		return self.body.isIncluded(in: rect)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public func negated(in dimensions: DimensionSet) -> Containee {
		return self.body.negated(in: dimensions)
	}
	
	public static func negate(_ target: inout Containee, in dimensions: DimensionSet) {
		target.negate(in: dimensions)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func convertedToOrigin(in size: CGSize) -> Containee {
		return self.convertedToOrigin(in: size)
	}
	
	public func convertedToCenter(in size: CGSize) -> Containee {
		return self.convertedToCenter(in: size)
	}
	
}

extension EltasoContainer where Containee == CGPoint {
	
	public func anchorPoint(in size: CGSize) -> Containee {
		return self.body.anchorPoint(in: size)
	}
	
	public func realPoint(in size: CGSize) -> Containee {
		return self.body.realPoint(in: size)
	}
	
}

// MARK: - Internal methods
extension CGPoint {
	
	static func reflected(byAdding vector: CGVector, to point: CGPoint = .zero) -> CGPoint {
		return CGPoint(x: point.x + vector.dx, y: point.y + vector.dy)
	}
	
	static func reflected(bySubtracting vector: CGVector, from point: CGPoint = .zero) -> CGPoint {
		return CGPoint(x: point.x - vector.dx , y: point.y - vector.dy)
	}
	
}

extension CGPoint {
	
	static func `init`(point: CGFloat) -> CGPoint {
		return CGPoint(x: point, y: point)
	}
	
}

extension CGPoint {
	
	func isIncluded(in rect: CGRect) -> Bool {
		return self.x …= rect.horizontalRange
			&& self.y …= rect.verticalRange
	}
	
}

extension CGPoint {
	
	var negated: CGPoint {
		
		return self.negated(in: .both)
		
	}
	
	func negated(in dimensions: EltasoContainer<CGPoint>.DimensionSet) -> CGPoint {
		
		var negated = self
		
		if dimensions.contains(.horizontal) {
			negated.x.negate()
		}
		
		if dimensions.contains(.vertical) {
			negated.y.negate()
		}
		
		return negated
		
	}
	
	mutating func negate(in dimensions: EltasoContainer<CGPoint>.DimensionSet) {
		self = self.negated(in: dimensions)
	}
	
}

extension CGPoint {
	
	func convertedToOrigin(in size: CGSize) -> CGPoint {
		
		let halfSize = size / 2
		let origin = CGPoint(x: self.x - halfSize.width, y: self.y - halfSize.height)
		return origin
		
	}
	
	func convertedToCenter(in size: CGSize) -> CGPoint {
		
		let halfSize = size / 2
		let center = CGPoint(x: self.x + halfSize.width, y: self.y + halfSize.height)
		return center
		
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
