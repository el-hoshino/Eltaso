//
//  UIGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIGestureRecognizer: EltasoCompatible { }

extension EltasoContainer where Containee == UIGestureRecognizer {
	
	public func touchCenter(in view: UIView?) -> CGPoint {
		let sumPoint = (0 ..< self.body.numberOfTouches).reduce(.zero, { (sum, touch) -> CGPoint in
			let point = self.body.location(ofTouch: touch, in: view)
			return sum + point
		})
		return sumPoint / CGFloat(self.body.numberOfTouches)
	}
	
	public var touchCenter: CGPoint {
		return self.touchCenter(in: self.body.view)
	}
	
}
