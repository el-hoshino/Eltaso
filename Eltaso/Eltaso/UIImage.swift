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
	
	open func getCroppedImage(inRect rect: CGRect) -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
		
		defer {
			UIGraphicsEndImageContext()
		}
		
		let drawPoint = rect.origin * -1
		self.draw(at: drawPoint)
		let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		return croppedImage
		
	}
	
}
