//
//  GestureConformedViewType.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/13.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol GestureConformedViewType: class {
	func setTranslation(_ translation: CGPoint)
	func setScale(_ scale: CGFloat)
}

public extension GestureConformedViewType where Self: UIView {
	
	func setTranslation(_ translation: CGPoint) {
		self.center += translation
	}
	
	func setScale(_ scale: CGFloat) {
		let currentPosition = self.center
		self.frame.size *= scale
		self.center = currentPosition
	}
	
}
