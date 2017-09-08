//
//  UIApplication.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UIApplication: EltasoCompatible {
	
}

extension EltasoContainer where Containee: UIApplication {
	
	public var currentViewController: UIViewController? {
		return self.body.currentViewController
	}
	
}

// MARK: - Internal methods
extension UIApplication {
	
	var currentViewController: UIViewController? {
		
		guard var controller = self.keyWindow?.rootViewController else {
			return nil
		}
		
		while let presentedController = controller.presentedViewController {
			controller = presentedController
		}
		
		return controller
		
	}
	
}
