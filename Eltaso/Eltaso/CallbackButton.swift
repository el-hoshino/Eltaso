//
//  CallbackButton.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackButton: UIButton {
	
	private var action: ((sender: CallbackButton) -> Void)?
	
	public var category: String?
	
	public init(image: UIImage, category: String? = nil, tag: Int = 0, withAction action: ((sender: CallbackButton) -> Void)? = nil) {
		
		self.action = action
		self.category = category
		
		super.init(frame: CGRect(origin: CGPointZero, size: image.size))
		
		self.tag = tag
		self.setImage(image, forState: .Normal)
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	public init(frame: CGRect = .zero, category: String? = nil, tag: Int = 0, withAction action: ((sender: CallbackButton) -> Void)? = nil) {
		
		self.action = action
		self.category = category
		
		super.init(frame: frame)
		
		self.tag = tag
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setAction(action: (sender: CallbackButton) -> Void) {
		
		self.action = action
		
	}
	
	func tapped(sender: CallbackButton) {
		
		self.action?(sender: sender)
		
	}
	
}
