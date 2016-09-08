//
//  CallbackSwitch.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class CallbackSwitch: UISwitch {
	
	fileprivate var onValueChangedAction: ((_ sender: CallbackSwitch) -> Void)?
	
	public override init(frame: CGRect) {
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(CallbackSwitch.switchValueChanged(_:)), for: .valueChanged)
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc fileprivate func switchValueChanged(_ sender: CallbackSwitch) {
		
		self.onValueChangedAction?(sender: sender)
		
	}
	
	open func setOnValueChangedAction(_ action: ((_ sender: CallbackSwitch) -> Void)) {
		
		self.onValueChangedAction = action
		
	}
	
}
