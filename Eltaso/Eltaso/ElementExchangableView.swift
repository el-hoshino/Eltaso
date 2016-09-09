//
//  ElementExchangableView.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol ElementExchangableView {
	
}

extension ElementExchangableView where Self: UIView {
	
	public func removeOldView(_ oldView: UIView?, andAddNewView newView: UIView?, at index: Int? = nil) {
		
		if let view = oldView {
			view.removeFromSuperview()
		}
		
		if let view = newView {
			if let index = index {
				self.insertSubview(view, at: index)
			} else {
				self.addSubview(view)
			}
		}
		
	}
	
	public func removeOldViews(_ oldViews: [UIView], andAddNewViews newViews: [UIView], at index: Int? = nil) {
		
		oldViews.forEach { (view) in
			view.removeFromSuperview()
		}
		
		if let index = index {
			newViews.reversed().forEach({ (view) in
				self.insertSubview(view, at: index)
			})
		} else {
			newViews.forEach({ (view) in
				self.addSubview(view)
			})
		}
		
	}
	
}
