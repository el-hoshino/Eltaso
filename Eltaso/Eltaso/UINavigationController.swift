//
//  UINavigationController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/03/15.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UINavigationController: EltasoCompatible {
	
}

extension EltasoContainer where Containee: UINavigationController {
	
	public func push(_ viewController: UIViewController, animated: Bool, completion: ((Bool) -> Void)?) {
		return self.body.push(viewController, animated: animated, completion: completion)
	}
	
	@discardableResult
	public func pop(animated: Bool, completion: ((Bool) -> Void)?) -> UIViewController? {
		return self.body.pop(animated: animated, completion: completion)
	}
	
}

// MARK: - Internal methods
extension UINavigationController {
	
	func push(_ viewController: UIViewController, animated: Bool, completion: ((Bool) -> Void)?) {
		
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
	func pop(animated: Bool, completion: ((Bool) -> Void)?) -> UIViewController? {
		
		let poppedViewController = self.popViewController(animated: animated)
		
		guard poppedViewController != nil else {
			completion?(false)
			return nil
		}
		
		if animated, let coordinator = self.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in completion?(true) }
			
		} else {
			completion?(true)
		}
		
		return poppedViewController
		
	}
	
}
