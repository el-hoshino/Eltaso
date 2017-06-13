//
//  CGVector.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

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

extension CGVector: EltasoCompatible { }

extension EltasoContainer where Containee == CGVector {
	
	public static let identity = CGVector(dx: 1, dy: 1)
	
}

extension EltasoContainer where Containee == CGVector {
	
	public static func reflected(from point: CGPoint, addedBy anotherPoint: CGPoint) -> CGVector {
		return CGVector(dx: point.x + anotherPoint.x, dy: point.y + anotherPoint.y)
	}
	
	public static func reflected(from point: CGPoint, subtractedBy anotherPoint: CGPoint = .zero) -> CGVector {
		return CGVector(dx: point.x - anotherPoint.x, dy: point.y - anotherPoint.y)
	}
	
}

extension EltasoContainer where Containee == CGVector {
	
	public var angle: CGFloat {
		return atan2(-self.body.dy, self.body.dx)
	}
	
}

extension EltasoContainer where Containee == CGVector {
	
	public func rotated(by angle: CGFloat) -> CGVector {
		
		let rotatedX = self.body.dx * cos(angle) + self.body.dy * -sin(angle)
		let rotatedY = self.body.dx * sin(angle) + self.body.dy * cos(angle)
		let rotatedVector = CGVector(dx: rotatedX, dy: rotatedY)
		
		return rotatedVector
		
	}
	
	public static func rotate(_ target: inout CGVector, by angle: CGFloat) {
		target = target.eltaso.rotated(by: angle)
	}
	
}
