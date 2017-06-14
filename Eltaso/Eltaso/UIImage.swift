//
//  UIImage.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIImage: EltasoCompatible {
	public var eltaso: EltasoContainer<UIImage> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == UIImage {
	
	public static func `init`(named name: String, inBundle bundle: Bundle?) -> Containee? {
		let image = Containee(named: name, in: bundle, compatibleWith: nil)
		return image
	}
	
}

extension EltasoContainer where Containee == UIImage {
	
	public func resized(to size: CGSize) -> Containee? {
		
		UIGraphicsBeginImageContextWithOptions(size, false, self.body.scale)
		
		let drawingRect = CGRect(origin: .zero, size: size)
		self.body.draw(in: drawingRect)
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	public func cropped(in rect: CGRect, onColor canvasColor: UIColor = .clear) -> Containee? {
		
		let opaque = canvasColor != .clear
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, self.body.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(rect.eltaso.zeroPositionedFrame)
		}
		
		let drawPoint = rect.origin.eltaso.negated(in: .both)
		self.body.draw(at: drawPoint)
		let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
	public enum RotatingMode {
		case keepingSize
		case showWholeImage
	}
	
	public func rotated(by angle: CGFloat, onColor canvasColor: UIColor = .clear, mode: RotatingMode = .showWholeImage) -> Containee? {
		
		let opaque = canvasColor != .clear
		let canvasSize: CGSize
		switch mode {
		case .keepingSize:
			canvasSize = self.body.size
			
		case .showWholeImage:
			canvasSize = self.body.size.eltaso.boundSizeAfterRotation(by: angle)
		}
		
		UIGraphicsBeginImageContextWithOptions(canvasSize, opaque, self.body.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		let canvasOrigin = canvasSize.eltaso.centerPoint.eltaso.negated
		let imageOrigin = self.body.size.eltaso.centerPoint.eltaso.negated
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(CGRect(origin: .zero, size: canvasSize))
		}
		
		context.translateBy(x: -canvasOrigin.x, y: -canvasOrigin.y)
		context.rotate(by: angle)
		
		self.body.draw(at: imageOrigin)
		let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return rotatedImage
		
	}
	
}
