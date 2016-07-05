//
//  CallbackSwitch.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackSwitch: UISwitch {
	
	private var action: (() -> Void)?
	
	public init(frame: CGRect, action: (() -> Void)? = nil) {
		
		self.action = action
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(CallbackSwitch.switchValueChanged(_:)), forControlEvents: .ValueChanged)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setAction(action: (() -> Void)) {
		
		self.action = action
		
	}
	
	func switchValueChanged(sender: UISwitch) {
		
		self.action?()
		
	}
	
}
