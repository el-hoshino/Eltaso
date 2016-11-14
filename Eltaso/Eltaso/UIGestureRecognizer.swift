//
//  UIGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
	
	open func touchCenter(in view: UIView?) -> CGPoint {
		let sumPoint = (0 ..< self.numberOfTouches).reduce(.zero, { (sum, touch) -> CGPoint in
			let point = self.location(ofTouch: touch, in: view)
			return sum + point
		})
		return sumPoint / CGFloat(self.numberOfTouches)
	}
	
	open var touchCenter: CGPoint {
		return self.touchCenter(in: self.view)
	}
	
}
