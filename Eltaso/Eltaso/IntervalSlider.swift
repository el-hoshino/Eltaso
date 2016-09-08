//
//  IntervalSlider.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class IntervalSlider: UISlider {
	
	open var interval: Float?
	
	fileprivate var onValueChangedAction: ((_ sender: IntervalSlider, _ newValue: Float) -> Void)?
	
	public init(frame: CGRect = .zero, interval: Float? = 1) {
		
		self.interval = interval
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(IntervalSlider.roundValue), for: .valueChanged)
		self.addTarget(self, action: #selector(IntervalSlider.valueChanged(_:)), for: .valueChanged)
		
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.interval = 1
		super.init(coder: aDecoder)
	}
	
	@objc fileprivate func roundValue() {
		
		guard let interval = self.interval else {
			return
		}
		
		let newValue = round(self.value / interval) * interval
		self.setValue(newValue, animated: false)
		
	}
	
	@objc fileprivate func valueChanged(_ sender: IntervalSlider) {
		self.onValueChangedAction?(sender, self.value)
	}
	
	open func setOnValueChangedAction(_ action: ((_ sender: IntervalSlider, _ newValue: Float) -> Void)?) {
		self.onValueChangedAction = action
	}
	
}
