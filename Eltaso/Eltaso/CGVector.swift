//
//  CGVector.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGVector {
	
	public static func reflected(from point: CGPoint, addedBy anotherPoint: CGPoint) -> CGVector {
		return CGVector(dx: point.x + anotherPoint.x, dy: point.y + anotherPoint.y)
	}
	
	public static func reflected(from point: CGPoint, subtractedBy anotherPoint: CGPoint = .zero) -> CGVector {
		return CGVector(dx: point.x - anotherPoint.x, dy: point.y - anotherPoint.y)
	}
	
}

extension CGVector {
	
	public var angle: CGFloat {
		return atan2(-self.dy, self.dx)
	}
	
}

extension CGVector {
	
	public func rotated(by angle: CGFloat) -> CGVector {
		
		let rotatedX = self.dx * cos(angle) + self.dy * -sin(angle)
		let rotatedY = self.dx * sin(angle) + self.dy * cos(angle)
		let rotatedVector = CGVector(dx: rotatedX, dy: rotatedY)
		
		return rotatedVector
		
	}
	
	public mutating func rotate(by angle: CGFloat) {
		self = self.rotated(by: angle)
	}
	
}
