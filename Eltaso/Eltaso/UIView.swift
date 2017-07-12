//
//  UIView.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension UIView: EltasoCompatible {
	public var eltaso: EltasoContainer<UIView> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == UIView {
	
	public var midPoint: CGPoint {
		return self.body.bounds.eltaso.midPoint
	}
	
}

extension EltasoContainer where Containee == UIView {
	
	public func removeAllSubviews() {
		self.body.subviews.forEach { (subview) in
			subview.removeFromSuperview()
		}
	}
	
	public func addSubviews(_ subviews: [UIView]) {
		subviews.forEach { (view) in
			self.body.addSubview(view)
		}
	}
	
}

extension EltasoContainer where Containee == UIView {
	
	public static func animateJumpViews(_ views: [Containee], forHeight height: CGFloat, within duration: TimeInterval, reversing: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		
		let initialDuration = duration * 0.2
		let reversingDuration = duration - initialDuration
		UIView.animate(withDuration: initialDuration, animations: { 
			views.forEach({ (view) in
				view.frame.origin.y -= height
			})
		}, completion: { (_) in
			UIView.animate(withDuration: reversingDuration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
				views.forEach({ (view) in
					view.frame.origin.y += height
					reversing?()
				})
			}, completion: completion)
		}) 
		
	}
	
}
