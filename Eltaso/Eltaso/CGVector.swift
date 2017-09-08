//
//  CGVector.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CGVector {
	
	public static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
	}
	
	public static func += (lhs: inout CGVector, rhs: CGVector) {
		lhs = lhs + rhs
	}
	
	public static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
	}
	
	public static func -= (lhs: inout CGVector, rhs: CGVector) {
		lhs = lhs - rhs
	}
	
	public static func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
		return CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
	}
	
	public static func *= (lhs: inout CGVector, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	public static func * (lhs: CGVector, rhs: CGScale) -> CGVector {
		return CGVector(dx: lhs.dx * rhs.horizontal, dy: lhs.dy * rhs.vertical)
	}
	
	public static func *= (lhs: inout CGVector, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGVector, rhs: CGFloat) -> CGVector {
		return CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
	}
	
	public static func /= (lhs: inout CGVector, rhs: CGFloat) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGVector, rhs: CGScale) -> CGVector {
		return CGVector(dx: lhs.dx / rhs.horizontal, dy: lhs.dy / rhs.vertical)
	}
	
	public static func /= (lhs: inout CGVector, rhs: CGScale) {
		lhs = lhs / rhs
	}
	
}

extension CGVector: EltasoCompatible {
	
}

extension EltasoContainer where Containee == CGVector {
	
	public static let identity = Containee.identity
	
}

extension EltasoContainer where Containee == CGVector {
	
	public static func reflected(from point: CGPoint, addedBy anotherPoint: CGPoint = .zero) -> Containee {
		return Containee.reflected(from: point, addedBy: anotherPoint)
	}
	
	public static func reflected(from point: CGPoint, subtractedBy anotherPoint: CGPoint) -> Containee {
		return Containee.reflected(from: point, subtractedBy: anotherPoint)
	}
	
}

extension EltasoContainer where Containee == CGVector {
	
	public var angle: CGFloat {
		return self.body.angle
	}
	
}

extension EltasoContainer where Containee == CGVector {
	
	public func rotated(by angle: CGFloat) -> Containee {
		return self.body.rotated(by: angle)
	}
	
	public static func rotate(_ target: inout Containee, by angle: CGFloat) {
		target.rotate(by: angle)
	}
	
}

// MARK: - Internal methods
extension CGVector {
	
	static let identity = CGVector(dx: 1, dy: 1)
	
}

extension CGVector {
	
	static func reflected(from point: CGPoint, addedBy anotherPoint: CGPoint = .zero) -> CGVector {
		return CGVector(dx: point.x + anotherPoint.x, dy: point.y + anotherPoint.y)
	}
	
	static func reflected(from point: CGPoint, subtractedBy anotherPoint: CGPoint) -> CGVector {
		return CGVector(dx: point.x - anotherPoint.x, dy: point.y - anotherPoint.y)
	}
	
}

extension CGVector {
	
	var angle: CGFloat {
		return atan2(-self.dy, self.dx)
	}
	
}

extension CGVector {
	
	func rotated(by angle: CGFloat) -> CGVector {
		
		let rotatedX = self.dx * cos(angle) + self.dy * -sin(angle)
		let rotatedY = self.dx * sin(angle) + self.dy * cos(angle)
		let rotatedVector = CGVector(dx: rotatedX, dy: rotatedY)
		
		return rotatedVector
		
	}
	
	mutating func rotate(by angle: CGFloat) {
		self = self.rotated(by: angle)
	}
	
}
