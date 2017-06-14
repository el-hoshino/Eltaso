//
//  UINavigationController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/03/15.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

extension UINavigationController: EltasoCompatible {
	public var eltaso: EltasoContainer<UINavigationController> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == UINavigationController {
	
	public func push(_ viewController: UIViewController, animated: Bool, completion: ((Bool) -> Void)?) {
		
		guard !self.body.viewControllers.contains(viewController) else {
			completion?(false)
			return
		}
		
		self.body.pushViewController(viewController, animated: animated)
		
		if animated, let coordinator = self.body.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
	}
	
	@discardableResult
	public func pop(animated: Bool, completion: ((Bool) -> Void)?) -> UIViewController? {
		
		let poppedViewController = self.body.popViewController(animated: animated)
		
		guard poppedViewController != nil else {
			completion?(false)
			return nil
		}
		
		if animated, let coordinator = self.body.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
		return poppedViewController
		
	}
	
}
