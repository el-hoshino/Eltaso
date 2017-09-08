//
//  UIRotationGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension EltasoContainer where Containee: UIRotationGestureRecognizer {
	
	public func resetRotation() {
		return self.body.resetRotation()
	}
	
}

// MARK: - Internal methods
extension UIRotationGestureRecognizer {
	
	func resetRotation() {
		self.rotation = 0
	}
	
}
