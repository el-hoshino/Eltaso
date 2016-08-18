//
//  CallbackSwitch.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackSwitch: UISwitch {
	
	private var onValueChangedAction: ((sender: CallbackSwitch) -> Void)?
	
	public override init(frame: CGRect) {
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(CallbackSwitch.switchValueChanged(_:)), forControlEvents: .ValueChanged)
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func switchValueChanged(sender: CallbackSwitch) {
		
		self.onValueChangedAction?(sender: sender)
		
	}
	
	public func setOnValueChangedAction(action: ((sender: CallbackSwitch) -> Void)) {
		
		self.onValueChangedAction = action
		
	}
	
}
