//
//  UIAlertController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIAlertController {
	
	public func addActions(actions: [UIAlertAction]) {
		actions.forEach { (action) in
			self.addAction(action)
		}
	}
	
}
