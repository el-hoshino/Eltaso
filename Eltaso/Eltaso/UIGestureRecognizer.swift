//
//  UIGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/14.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UIGestureRecognizer: EltasoCompatible {
	
}

extension EltasoContainer where Containee: UIGestureRecognizer {
	
	public func touchCenter(in view: UIView?) -> CGPoint {
		return self.body.touchCenter(in: view)
	}
	
	public var touchCenter: CGPoint {
		return self.body.touchCenter
	}
	
}

// MARK: - Internal methods
extension UIGestureRecognizer {
	
	func touchCenter(in view: UIView?) -> CGPoint {
		
		let sumPoint = (0 ..< self.numberOfTouches).reduce(.zero, { (sum, touch) -> CGPoint in
			let point = self.location(ofTouch: touch, in: view)
			return sum + point
		})
		
		return sumPoint / CGFloat(self.numberOfTouches)
		
	}
	
	var touchCenter: CGPoint {
		
		return self.touchCenter(in: self.view)
		
	}
	
}
