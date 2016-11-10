//
//  TranslatableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol TranslatableView: class {
	func translate(by translation: CGPoint)
}

extension TranslatableView where Self: UIView {
	
	public func translate(by translation: CGPoint) {
		self.transform.translateBy(x: translation.x, y: translation.y)
	}
	
}
