//
//  CGImage.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

extension CGImage: EltasoCompatible { }

extension EltasoContainer where Containee == CGImage {
	
	public var size: CGSize {
		return CGSize(width: self.body.width, height: self.body.height)
	}
	
}

extension EltasoContainer where Containee == CGImage {
	
	public static func createImage(ofColor color: CGColor, opaque: Bool = false, forSize size: CGSize, atScale scale: CGFloat = 0) -> Containee? {
		
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

extension EltasoContainer where Containee == CGImage {
	
	public func resized(to size: CGSize, scale: CGFloat = 0) -> Containee {
		
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return self.body
		}
		
		context.translateBy(x: 0, y: size.height)
		context.scaleBy(x: 1, y: -1)
		
		context.draw(self.body, in: CGRect(origin: .zero, size: size))
		
		guard let resizedImage = context.makeImage() else {
			return self.body
		}
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	public func cropped(in rect: CGRect, onColor canvasColor: CGColor = UIColor.clear.cgColor, scale: CGFloat = 0) -> Containee {
		
		let opaque = canvasColor.alpha > 0
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return self.body
		}
		
		context.translateBy(x: 0, y: rect.size.height)
		context.scaleBy(x: 1, y: -1)
		
		if opaque {
			context.setFillColor(canvasColor)
			context.fill(rect.eltaso.zeroPositionedFrame)
		}
		
		context.eltaso.draw(self.body, at: rect.origin.eltaso.negated(in: .both))
		
		guard let croppedImage = context.makeImage() else {
			return self.body
		}
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
}
