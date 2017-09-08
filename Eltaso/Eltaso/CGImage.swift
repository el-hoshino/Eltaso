//
//  CGImage.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreGraphics

// MARK: - Public methods
extension CGImage: EltasoCompatible {
	
}

extension EltasoContainer where Containee == CGImage {
	
	public var size: CGSize {
		return self.body.size
	}
	
}

extension EltasoContainer where Containee == CGImage {
	
	public static func makeImage(ofColor color: CGColor, opaque: Bool = false, forSize size: CGSize, atScale scale: CGFloat = 0) -> Containee? {
		return Containee.makeImage(ofColor: color, opaque: opaque, forSize: size, atScale: scale)
	}
	
}

extension EltasoContainer where Containee == CGImage {
	
	public func resized(to size: CGSize, scale: CGFloat = 0) -> Containee {
		return self.body.resized(to: size, scale: scale)
	}
	
	public func cropped(in rect: CGRect, onColor canvasColor: CGColor = UIColor.clear.cgColor, scale: CGFloat = 0) -> Containee {
		return self.body.cropped(in: rect, onColor: canvasColor, scale: scale)
	}
	
}

// MARK: Internal methods
extension CGImage {
	
	var size: CGSize {
		return CGSize(width: self.width, height: self.height)
	}
	
}

extension CGImage {
	
	static func makeImage(ofColor color: CGColor, opaque: Bool = false, forSize size: CGSize, atScale scale: CGFloat = 0) -> CGImage? {
		
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
	
	func resized(to size: CGSize, scale: CGFloat = 0) -> CGImage {
		
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
	
	func cropped(in rect: CGRect, onColor canvasColor: CGColor = UIColor.clear.cgColor, scale: CGFloat = 0) -> CGImage {
		
		let opaque = canvasColor.alpha > 0
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return self
		}
		
		context.translateBy(x: 0, y: rect.size.height)
		context.scaleBy(x: 1, y: -1)
		
		if opaque {
			context.setFillColor(canvasColor)
			context.fill(rect.zeroPositionedFrame)
		}
		
		context.draw(self, at: rect.origin.negated)
		
		guard let croppedImage = context.makeImage() else {
			return self
		}
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
}
