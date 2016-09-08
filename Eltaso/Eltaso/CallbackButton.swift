//
//  CallbackButton.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class CallbackButton: UIButton {
	
	fileprivate var onTappedAction: ((_ sender: CallbackButton) -> Void)?
	fileprivate var onLongPressedAction: ((_ sender: CallbackButton) -> Void)?
	
	lazy fileprivate var longPressGesture: UILongPressGestureRecognizer = {
		let gesture = UILongPressGestureRecognizer(target: self, action: #selector(CallbackButton.longPressed(_:)))
		return gesture
	}()
	open var longPressEnabled = false {
		willSet {
			switch newValue {
			case true:
				self.addGestureRecognizer(self.longPressGesture)
				
			case false:
				self.removeGestureRecognizer(self.longPressGesture)
			}
		}
	}
	
	open var category: String?
	
	public init(image: UIImage, category: String? = nil, tag: Int = 0) {
		
		self.category = category
		
		super.init(frame: CGRect(origin: CGPoint.zero, size: image.size))
		
		self.tag = tag
		self.setImage(image, for: UIControlState())
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), for: .touchUpInside)
		
	}
	
	public init(frame: CGRect = .zero, category: String? = nil, tag: Int = 0) {
		
		self.category = category
		
		super.init(frame: frame)
		
		self.tag = tag
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), for: .touchUpInside)
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc fileprivate func tapped(_ sender: CallbackButton) {
		
		self.onTappedAction?(sender)
		
	}
	
	@objc fileprivate func longPressed(_ sender: UILongPressGestureRecognizer) {
		
		switch sender.state {
		case .began:
			self.onLongPressedAction?(self)
			
		default:
			return
		}
		
	}
	
	open func setOnTappedAction(_ action: @escaping (_ sender: CallbackButton) -> Void) {
		
		self.onTappedAction = action
		
	}
	
	open func setOnLongPressedAction(_ action: @escaping (_ sender: CallbackButton) -> Void) {
		
		self.onLongPressedAction = action
		
	}
	
}
