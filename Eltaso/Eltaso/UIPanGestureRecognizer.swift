//
//  UIPanGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension EltasoContainer where Containee == UIPanGestureRecognizer {
	
	public func resetTranslation(inView view: UIView? = nil) {
		self.body.setTranslation(.zero, in: view)
	}
	
}
