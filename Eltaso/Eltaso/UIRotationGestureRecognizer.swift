//
//  UIRotationGestureRecognizer.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension EltasoContainer where Containee == UIRotationGestureRecognizer {
	
	public func resetRotation() {
		self.body.rotation = 0
	}
	
}
