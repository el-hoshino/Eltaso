//
//  UIPanGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIPanGestureRecognizer {
	
	public func resetTranslation(inView view: UIView?) {
		self.setTranslation(.zero, in: view)
	}
	
}
