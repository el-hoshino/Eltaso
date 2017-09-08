//
//  UIAlertController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UIAlertController: EltasoCompatible {
	
}

extension EltasoContainer where Containee: UIAlertController {
	
	public func addActions(_ actions: [UIAlertAction]) {
		return self.body.addActions(actions)
	}
	
}

// MARK: - Internal methods
extension UIAlertController {
	
	func addActions(_ actions: [UIAlertAction]) {
		actions.forEach { (action) in
			self.addAction(action)
		}
	}
	
}
