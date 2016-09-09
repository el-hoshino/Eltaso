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
		
		self.addTarget(self, action: #selector(CallbackSwitch.valueChanged(_:)), for: .valueChanged)
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.addTarget(self, action: #selector(CallbackSwitch.valueChanged(_:)), for: .valueChanged)
	}
	
}

extension CallbackSwitch {
	
	@objc fileprivate func valueChanged(_ sender: CallbackSwitch) {
		
		self.onValueChangedAction?(sender)
		
	}
	
}

extension CallbackSwitch {
	
	open func setOnValueChangedAction(_ action: @escaping (_ sender: CallbackSwitch) -> Void) {
		
		self.onValueChangedAction = action
		
	}
	
}
