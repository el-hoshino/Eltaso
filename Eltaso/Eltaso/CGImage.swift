//
//  CGImage.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

extension CGImage {
	
	public var size: CGSize {
		return CGSize(width: self.width, height: self.height)
	}
	
}

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

extension CGImage {
	
	public func resized(to size: CGSize, scale: CGFloat = 0) -> CGImage {
		
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return self
		}
		
		context.translateBy(x: 0, y: size.height)
		context.scaleBy(x: 1, y: -1)
		
		context.draw(self, in: CGRect(origin: .zero, size: size))
		
		guard let resizedImage = context.makeImage() else {
			return self
		}
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	public func cropped(in rect: CGRect, scale: CGFloat = 0) -> CGImage {
		
		UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return self
		}
		
		context.translateBy(x: 0, y: rect.size.height)
		context.scaleBy(x: 1, y: -1)
		
		context.draw(self, at: rect.origin)
		
		guard let croppedImage = context.makeImage() else {
			return self
		}
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
}
