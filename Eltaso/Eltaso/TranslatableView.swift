//
//  TranslatableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol TranslatableView: class {
	@available(*, deprecated: 3.1.1, message: "Use translate(by: CGVector) instead")
	func translate(by translation: CGPoint)
	func translate(by translation: CGVector)
}

extension TranslatableView where Self: UIView {
	
	public func translate(by translation: CGPoint) {
		self.transform.translateBy(x: translation.x, y: translation.y)
	}
	
	public func translate(by translation: CGVector) {
		self.transform.translateBy(x: translation.dx, y: translation.dy)
	}
	
}
