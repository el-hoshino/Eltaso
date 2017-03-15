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
	
	@discardableResult
	public func popViewController(animated: Bool, completion: ((Bool) -> Void)?) -> UIViewController? {
		
		let poppedViewController = self.popViewController(animated: animated)
		
		guard poppedViewController != nil else {
			completion?(false)
			return poppedViewController
		}
		
		if animated, let coordinator = self.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
		return poppedViewController
		
	}
	
}
