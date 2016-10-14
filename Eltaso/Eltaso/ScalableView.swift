//
//  ScalableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol ScalableView {
	func scale(by scale: CGFloat)
}

extension ScalableView where Self: UIView {
	
	public func scale(by scale: CGFloat) {
		let currentPosition = self.center
		self.frame.size *= scale
		self.center = currentPosition
	}
	
}
