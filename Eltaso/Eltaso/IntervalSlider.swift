//
//  IntervalSlider.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class IntervalSlider: UISlider {
	
	public var interval: Float?
	
	private var onValueChangedAction: ((sender: IntervalSlider, newValue: Float) -> Void)?
	
	public init(frame: CGRect = .zero, interval: Float? = 1) {
		
		self.interval = interval
		
		super.init(frame: frame)
		
		self.addTarget(self, action: #selector(IntervalSlider.roundValue), forControlEvents: .ValueChanged)
		self.addTarget(self, action: #selector(IntervalSlider.additionalActionOnValueChanged(_:)), forControlEvents: .ValueChanged)
		
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.interval = 1
		super.init(coder: aDecoder)
	}
	
	@objc private func roundValue() {
		
		guard let interval = self.interval else {
			return
		}
		
		let newValue = round(self.value / interval) * interval
		self.setValue(newValue, animated: false)
		
	}
	
	@objc private func additionalActionOnValueChanged(sender: IntervalSlider) {
		self.onValueChangedAction?(sender: sender, newValue: self.value)
	}
	
	public func setOnValueChangedAction(action: ((sender: IntervalSlider, newValue: Float) -> Void)?) {
		self.onValueChangedAction = action
	}
	
}
