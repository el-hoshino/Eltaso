//
//  UINavigationController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/03/15.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

extension UINavigationController {
	
	public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: ((Bool) -> Void)?) {
		
		guard !self.viewControllers.contains(viewController) else {
			completion?(false)
			return
		}
		
		self.pushViewController(viewController, animated: animated)
		
		if animated, let coordinator = self.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
	}
	
	// FIXME: Here's a bug in Swift 3.x that @discardableResult doesn't work for optional returning values, so currently this method returns nothing. In the future when this bug is fixed, this method should return UINavigationController#popViewController(animated:)'s return value, which is poppedViewController here in the code.
	public func popViewController(animated: Bool, completion: ((Bool) -> Void)?) {
		
		let poppedViewController = self.popViewController(animated: animated)
		
		guard poppedViewController != nil else {
			completion?(false)
			return
		}
		
		if animated, let coordinator = self.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
		return
		
	}
	
}
