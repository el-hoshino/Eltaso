//
//  UIViewController.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/12.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

extension UIViewController {
	
	public func push(_ viewController: UIViewController, animated: Bool = true, completion: ((_ finished: Bool) -> Void)? = nil) {
		
		self.addChildViewController(viewController)
		viewController.view.frame = self.view.bounds
		viewController.view.frame.origin.x = self.view.bounds.width
		self.view.addSubview(viewController.view)
		viewController.didMove(toParentViewController: self)
		
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
				viewController.view.frame.origin.x = 0
			}, completion: completion)
			
		} else {
			viewController.view.frame.origin.x = 0
			completion?(true)
		}
		
	}
	
	public func pop(animated: Bool = true, completion: ((_ finished: Bool) -> Void)? = nil) {
		
		guard let parent = self.parent else {
			completion?(false)
			return
		}
		
		self.willMove(toParentViewController: nil)
		
		func moveView() {
			self.view.frame.origin.x = parent.view.bounds.width
		}
		
		func postMoveAction() {
			self.view.removeFromSuperview()
			self.removeFromParentViewController()
		}
		
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
				moveView()
			}, completion: { (finished) in
				postMoveAction()
				completion?(finished)
			})
			
		} else {
			postMoveAction()
			completion?(true)
		}
		
	}
	
}
