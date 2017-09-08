//
//  UIImage.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UIImage: EltasoCompatible {
	
	public var eltaso: EltasoContainer<UIImage> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == UIImage {
	
	public static func `init`(named name: String, inBundle bundle: Bundle?) -> Containee? {
		return Containee(named: name, inBundle: bundle)
	}
	
}

extension EltasoContainer where Containee: UIImage {
	
	public func resized(to size: CGSize) -> UIImage? {
		return self.body.resized(to: size)
	}
	
	public func cropped(in rect: CGRect, onColor canvasColor: UIColor = .clear) -> UIImage? {
		return self.body.cropped(in: rect, onColor: canvasColor)
	}
	
	public enum RotatingMode {
		case keepingSize
		case showWholeImage
	}
	
	public func rotated(by angle: CGFloat, onColor canvasColor: UIColor = .clear, mode: EltasoContainer<UIImage>.RotatingMode = .showWholeImage) -> UIImage? {
		return self.body.rotated(by: angle, onColor: canvasColor, mode: mode)
	}
	
}

// MARK: - Internal methods
extension UIImage {
	
	static func `init`(named name: String, inBundle bundle: Bundle?) -> UIImage? {
		let image = UIImage(named: name, in: bundle, compatibleWith: nil)
		return image
	}
	
}

extension UIImage {
	
	func resized(to size: CGSize) -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
		
		let drawingRect = CGRect(origin: .zero, size: size)
		self.draw(in: drawingRect)
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	func cropped(in rect: CGRect, onColor canvasColor: UIColor = .clear) -> UIImage? {
		
		let opaque = canvasColor != .clear
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, self.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(rect.zeroPositionedFrame)
		}
		
		let drawPoint = rect.origin.negated
		self.draw(at: drawPoint)
		let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
	func rotated(by angle: CGFloat, onColor canvasColor: UIColor = .clear, mode: EltasoContainer<UIImage>.RotatingMode = .showWholeImage) -> UIImage? {
		
		let opaque = canvasColor != .clear
		let canvasSize: CGSize
		switch mode {
		case .keepingSize:
			canvasSize = self.size
			
		case .showWholeImage:
			canvasSize = self.size.boundSizeAfterRotation(by: angle)
		}
		
		UIGraphicsBeginImageContextWithOptions(canvasSize, opaque, self.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		let canvasOrigin = canvasSize.centerPoint.negated
		let imageOrigin = self.size.centerPoint.negated
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(CGRect(origin: .zero, size: canvasSize))
		}
		
		context.translateBy(x: -canvasOrigin.x, y: -canvasOrigin.y)
		context.rotate(by: angle)
		
		self.draw(at: imageOrigin)
		let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return rotatedImage
		
	}
	
}
