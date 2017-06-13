//
//  UIPinchGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/28.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension EltasoContainer where Containee == UIPinchGestureRecognizer {
	
	public func resetScale() {
		self.body.scale = 1
	}
	
}
