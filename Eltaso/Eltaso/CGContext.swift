//
//  CGContext.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

extension CGContext: EltasoCompatible { }

extension EltasoContainer where Containee == CGContext {
	
	func draw(_ image: CGImage, at point: CGPoint) {
		
		let drawingRect = CGRect(origin: point, size: image.eltaso.size)
		self.body.draw(image, in: drawingRect)
		
	}
	
}
