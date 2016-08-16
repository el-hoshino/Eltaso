//
//  CallbackButton.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class CallbackButton: UIButton {
	
	private var onTappedAction: ((sender: CallbackButton) -> Void)?
	private var onLongPressedAction: ((sender: CallbackButton) -> Void)?
	
	lazy private var longPressGesture: UILongPressGestureRecognizer = {
		let gesture = UILongPressGestureRecognizer(target: self, action: #selector(CallbackButton.longPressed(_:)))
		return gesture
	}()
	public var longPressEnabled = false {
		willSet {
			switch newValue {
			case true:
				self.addGestureRecognizer(self.longPressGesture)
				
			case false:
				self.removeGestureRecognizer(self.longPressGesture)
			}
		}
	}
	
	public var category: String?
	
	public init(image: UIImage, category: String? = nil, tag: Int = 0) {
		
		self.category = category
		
		super.init(frame: CGRect(origin: CGPointZero, size: image.size))
		
		self.tag = tag
		self.setImage(image, forState: .Normal)
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	public init(frame: CGRect = .zero, category: String? = nil, tag: Int = 0) {
		
		self.category = category
		
		super.init(frame: frame)
		
		self.tag = tag
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), forControlEvents: .TouchUpInside)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func tapped(sender: CallbackButton) {
		
		self.onTappedAction?(sender: sender)
		
	}
	
	@objc private func longPressed(sender: UILongPressGestureRecognizer) {
		
		switch sender.state {
		case .Began:
			self.onLongPressedAction?(sender: self)
			
		default:
			return
		}
		
	}
	
	public func setOnTappedAction(action: (sender: CallbackButton) -> Void) {
		
		self.onTappedAction = action
		
	}
	
	public func setOnLongPressedAction(action: (sender: CallbackButton) -> Void) {
		
		self.onLongPressedAction = action
		
	}
	
}
