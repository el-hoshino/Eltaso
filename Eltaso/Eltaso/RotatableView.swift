//
//  RotatableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol RotatableView {
	func rotate(by angle: CGFloat)
}

extension RotatableView where Self: UIView {
	
	public func rotate(by angle: CGFloat) {
		self.transform = self.transform.rotated(by: angle)
	}
	
}
