//
//  CallbackButton.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackButton: UIButton {
	
	private var action: (() -> Void)?
	
	public init(image: UIImage, withAction action: (() -> Void)? = nil) {
		
		self.action = action
		
		super.init(frame: CGRect(origin: CGPointZero, size: image.size))
		
		self.setImage(image, forState: .Normal)
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	public init(frame: CGRect, withAction action: (() -> Void)? = nil) {
		
		self.action = action
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	public convenience init() {
		
		self.init(frame: CGRectZero)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setAction(action: () -> Void) {
		
		self.action = action
		
	}
	
	func tapped(sender: CallbackButton) {
		
		self.action?()
		
	}
	
}
