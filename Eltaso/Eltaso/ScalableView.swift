//
//  ScalableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol ScalableView: class {
	func scale(by scale: CGFloat, from scalingCenter: CGPoint?)
}

extension ScalableView where Self: UIView {
	
	public func scale(by scale: CGFloat, from scalingCenter: CGPoint?) {
		
		self.transform.scaleBy(x: scale, y: scale)
		
		if let scalingCenter = scalingCenter {
			let offset = self.midPoint - scalingCenter
			let translation = offset * (scale - 1)
			self.transform.translateBy(x: translation.x, y: translation.y)
		}
		
	}
	
}
