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
		
		viewController.willMove(toParentViewController: self)
		
		self.viewWillDisappear(animated)
		viewController.viewWillAppear(animated)
		
		self.addChildViewController(viewController)
		viewController.view.frame = self.view.bounds
		viewController.view.frame.origin.x = self.view.bounds.width
		
		self.view.addSubview(viewController.view)
		viewController.didMove(toParentViewController: self)
		
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
				viewController.view.frame.origin.x = 0
			}, completion: { finished in
				completion?(finished)
				viewController.viewDidAppear(animated)
				self.viewDidDisappear(animated)
			})
			
		} else {
			viewController.view.frame.origin.x = 0
			completion?(true)
			viewController.viewDidAppear(animated)
			self.viewDidDisappear(animated)
		}
		
	}
	
	public func pop(animated: Bool = true, completion: ((_ finished: Bool) -> Void)? = nil) {
		
		guard let parent = self.parent else {
			completion?(false)
			return
		}
		
		self.willMove(toParentViewController: nil)
		
		self.viewWillDisappear(animated)
		parent.viewWillAppear(animated)
		
		func moveView() {
			self.view.frame.origin.x = parent.view.bounds.width
		}
		
		func postMoveAction() {
			self.view.removeFromSuperview()
			self.removeFromParentViewController()
			self.didMove(toParentViewController: nil)
		}
		
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
				moveView()
			}, completion: { (finished) in
				postMoveAction()
				completion?(finished)
				parent.viewDidAppear(animated)
				self.viewDidDisappear(animated)
			})
			
		} else {
			postMoveAction()
			completion?(true)
			parent.viewDidAppear(animated)
			self.viewDidDisappear(animated)
		}
		
	}
	
}
