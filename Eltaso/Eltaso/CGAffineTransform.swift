
//
//  CGAffineTransform.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGAffineTransform {
	
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
