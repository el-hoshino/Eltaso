//
//  UIPanGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension EltasoContainer where Containee: UIPanGestureRecognizer {
	
	public func resetTranslation(in view: UIView? = nil) {
		return self.body.resetTranslation(in: view)
	}
	
}

// MARK: - Internal methods
extension UIPanGestureRecognizer {
	
	func resetTranslation(in view: UIView? = nil) {
		
		self.setTranslation(.zero, in: view)
		
	}
	
}
