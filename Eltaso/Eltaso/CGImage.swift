//
//  CGImage.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

extension CGImage {
	
	static func createImage(ofColor color: CGColor, opaque: Bool = false, forSize size: CGSize, atScale scale: CGFloat = 0) -> CGImage? {
		
		UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		context.setFillColor(color)
		context.fill(CGRect(origin: .zero, size: size))
		
		let image = context.makeImage()
		UIGraphicsEndImageContext()
		
		return image
		
	}
	
}
