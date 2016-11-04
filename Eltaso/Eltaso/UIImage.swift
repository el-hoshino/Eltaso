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
		
		UIGraphicsBeginImageContextWithOptions(size, true, self.scale)
		
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
	
}
