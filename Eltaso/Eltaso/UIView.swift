//
//  UIView.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension UIView: EltasoCompatible {
	
}

extension EltasoContainer where Containee: UIView {
	
	public var midPoint: CGPoint {
		return self.body.midPoint
	}
	
}

extension EltasoContainer where Containee: UIView {
	
	public func removeAllSubviews() {
		return self.body.removeAllSubviews()
	}
	
	public func addSubviews(_ subviews: [UIView]) {
		return self.body.addSubviews(subviews)
	}
	
}

extension EltasoContainer where Containee: UIView {
	
	public static func animateJumpViews(_ views: [Containee], forHeight height: CGFloat, within duration: TimeInterval, reversing: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		return Containee.animateJumpViews(views, forHeight: height, within: duration, reversing: reversing, completion: completion)
	}
	
}

// MARK: - Internal methods
extension UIView {
	
	var midPoint: CGPoint {
		return self.bounds.midPoint
	}
	
}

extension UIView {
	
	func removeAllSubviews() {
		self.subviews.forEach { (subview) in
			subview.removeFromSuperview()
		}
	}
	
	func addSubviews(_ subviews: [UIView]) {
		subviews.forEach { (view) in
			self.addSubview(view)
		}
	}
	
}

extension UIView {
	
	static func animateJumpViews(_ views: [UIView], forHeight height: CGFloat, within duration: TimeInterval, reversing: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		
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
