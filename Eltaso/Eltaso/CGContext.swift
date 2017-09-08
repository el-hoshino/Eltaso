//
//  CGContext.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

// MARK: - Public methods
extension CGContext: EltasoCompatible {
	
}

extension EltasoContainer where Containee == CGContext {
	
	func draw(_ image: CGImage, at point: CGPoint) {
		return self.body.draw(image, at: point)
	}
	
}

// MARK: - Internal methods
extension CGContext {
	
	func draw(_ image: CGImage, at point: CGPoint) {
		
		let drawingRect = CGRect(origin: point, size: image.size)
		self.draw(image, in: drawingRect)
		
	}
	
}
