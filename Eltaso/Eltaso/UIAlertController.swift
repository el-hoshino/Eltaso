//
//  UIAlertController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIAlertController: EltasoCompatible {
	public var eltaso: EltasoContainer<UIAlertController> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == UIAlertController {
	
	public func addActions(_ actions: [UIAlertAction]) {
		actions.forEach { (action) in
			self.body.addAction(action)
		}
	}
	
}
