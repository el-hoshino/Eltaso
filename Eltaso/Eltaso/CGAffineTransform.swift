
//
//  CGAffineTransform.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGAffineTransform {
	
	public var translation: (x: CGFloat, y: CGFloat) {
		return (self.tx, self.ty)
	}
	
	public var scale: (x: CGFloat, y: CGFloat) {
		return (sqrt(self.a * self.a + self.c * self.c), sqrt(self.b * self.b + self.d * self.d))
	}
	
	public var rotation: CGFloat {
		return atan2(self.b, self.a)
	}
	
	public mutating func translateBy(x: CGFloat, y: CGFloat) {
		self = self.translatedBy(x: x, y: y)
	}
	
	public mutating func scaleBy(x: CGFloat, y: CGFloat) {
		self = self.scaledBy(x: x, y: y)
	}
	
	public mutating func rotate(by angle: CGFloat) {
		self = self.rotated(by: angle)
	}
	
	public mutating func invert() {
		self = self.inverted()
	}
	
}
