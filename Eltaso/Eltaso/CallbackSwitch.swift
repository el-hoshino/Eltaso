//
//  CallbackSwitch.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackSwitch: UISwitch {
	
	private var action: ((sender: CallbackSwitch) -> Void)?
	
	public init(frame: CGRect = .zero, action: ((sender: CallbackSwitch) -> Void)? = nil) {
		
		self.action = action
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(CallbackSwitch.switchValueChanged(_:)), forControlEvents: .ValueChanged)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func switchValueChanged(sender: CallbackSwitch) {
		
		self.action?(sender: sender)
		
	}
	
	public func setAction(action: ((sender: CallbackSwitch) -> Void)) {
		
		self.action = action
		
	}
	
}
