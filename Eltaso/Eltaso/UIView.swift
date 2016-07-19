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
	
}
