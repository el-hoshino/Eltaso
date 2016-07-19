//
//  UIView.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension UIView {
	
	public func removeAllSubviews() {
		self.subviews.forEach { (subview) in
			subview.removeFromSuperview()
		}
	}
	
	public func addSubviews(subviews: [UIView]) {
		subviews.forEach { (view) in
			self.addSubview(view)
		}
	}
	
	public static func animateJumpViews(views: [UIView], forHeight height: CGFloat, within duration: NSTimeInterval, reversing: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		
		let initialDuration = duration * 0.2
		let reversingDuration = duration - initialDuration
		UIView.animateWithDuration(initialDuration, animations: { 
			views.forEach({ (view) in
				view.frame.origin.y -= height
			})
		}) { (_) in
			UIView.animateWithDuration(reversingDuration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
				views.forEach({ (view) in
					view.frame.origin.y += height
					reversing?()
				})
			}, completion: completion)
		}
		
	}
	
}
