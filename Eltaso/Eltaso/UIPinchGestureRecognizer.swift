//
//  UIPinchGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension EltasoContainer where Containee: UIPinchGestureRecognizer {
	
	public func resetScale() {
		return self.body.resetScale()
	}
	
}

// MARK: - Internal methods
extension UIPinchGestureRecognizer {
	
	func resetScale() {
		
		self.scale = 1
		
	}
	
}
