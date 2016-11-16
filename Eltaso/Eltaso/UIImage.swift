//
//  UIImage.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIImage {
	
	public convenience init?(named name: String, inBundle bundle: Bundle?) {
		self.init(named: name, in: bundle, compatibleWith: nil)
	}
	
}

extension UIImage {
	
	open func resized(to size: CGSize) -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
		
		let drawingRect = CGRect(origin: .zero, size: size)
		self.draw(in: drawingRect)
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	open func cropped(in rect: CGRect, onColor canvasColor: UIColor = .clear) -> UIImage? {
		
		let opaque = canvasColor != .clear
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, self.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(rect.zeroPositionedFrame)
		}
		
		let drawPoint = rect.origin.inverted(in: .both)
		self.draw(at: drawPoint)
		let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
	public enum RotatingMethod {
		case keepingSize
		case showWholeImage
	}
	
	open func rotated(by angle: CGFloat, onColor canvasColor: UIColor = .clear, rotatingMethod: RotatingMethod = .showWholeImage) -> UIImage? {
		
		let opaque = canvasColor != .clear
		let canvasSize: CGSize
		switch rotatingMethod {
		case .keepingSize:
			canvasSize = self.size
			
		case .showWholeImage:
			canvasSize = self.size.boundSizeAfterRotation(by: angle)
		}
		
		UIGraphicsBeginImageContextWithOptions(canvasSize, opaque, self.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		let canvasOrigin = CGPoint(x: -canvasSize.width / 2, y: -canvasSize.height / 2)
		let imageOrigin = CGPoint(x: -self.size.width / 2, y: -self.size.height / 2)
		
		if opaque {
			
		}
		
		context.translateBy(x: -canvasOrigin.x, y: -canvasOrigin.y)
		context.rotate(by: angle)
		
		self.draw(at: imageOrigin)
		let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return rotatedImage
		
	}
	
}
