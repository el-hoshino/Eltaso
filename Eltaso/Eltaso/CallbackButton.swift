//
//  CallbackButton.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class CallbackButton: UIButton {
	
	private var onTappedAction: ((_ sender: CallbackButton) -> Void)?
	private var onLongPressedAction: ((_ sender: CallbackButton) -> Void)?
	
	private lazy var longPressGesture: UILongPressGestureRecognizer = {
		let gesture = UILongPressGestureRecognizer(target: self, action: #selector(CallbackButton.longPressed(_:)))
		return gesture
	}()
	
	public var longPressEnabled = false {
		willSet {
			switch newValue {
			case true:
				if let gestures = self.gestureRecognizers, gestures.contains(self.longPressGesture) {
					self.addGestureRecognizer(self.longPressGesture)
				}
				
			case false:
				if let gestures = self.gestureRecognizers, !gestures.contains(self.longPressGesture) {
					self.removeGestureRecognizer(self.longPressGesture)
				}
			}
		}
	}
	
	public var category: String?
	
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
		super.init(coder: aDecoder)
		self.addTarget(self, action: #selector(CallbackButton.tapped(_:)), for: .touchUpInside)
	}
	
}

extension CallbackButton {
	
	@objc private func tapped(_ sender: CallbackButton) {
		
		self.onTappedAction?(sender)
		
	}
	
	@objc private func longPressed(_ sender: UILongPressGestureRecognizer) {
		
		switch sender.state {
		case .began:
			self.onLongPressedAction?(self)
			
		default:
			return
		}
		
	}
	
}

extension CallbackButton {
	
	open func setOnTappedAction(_ action: @escaping (_ sender: CallbackButton) -> Void) {
		
		self.onTappedAction = action
		
	}
	
	open func setOnLongPressedAction(_ action: @escaping (_ sender: CallbackButton) -> Void) {
		
		self.onLongPressedAction = action
		
	}
	
}
