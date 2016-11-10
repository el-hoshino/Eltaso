//
//  UIPinchGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIPinchGestureRecognizer {
	
	public func resetScale() {
		self.scale = 1
	}
	
	open func scalingCenter(in view: UIView?) -> CGPoint {
		let sumPoint = (0 ..< self.numberOfTouches).reduce(.zero, { (sum, touch) -> CGPoint in
			let point = self.location(ofTouch: touch, in: view)
			return sum + point
		})
		return sumPoint / CGFloat(self.numberOfTouches)
	}
	
}
