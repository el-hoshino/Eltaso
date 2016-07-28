//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension CGRect {
	
	public var top: CGFloat {
		get {
			return self.origin.y
		}
		set {
			self.origin.y = newValue
		}
	}
	
	public var bottom: CGFloat {
		get {
			return self.origin.y + self.height
		}
		set {
			self.size.height = newValue - self.origin.y
		}
	}
	
	public var left: CGFloat {
		get {
			return self.origin.x
		}
		set {
			self.origin.x = newValue
		}
	}
	
	public var right: CGFloat {
		get {
			return self.origin.x + self.width
		}
		set {
			self.size.width = newValue - self.origin.x
		}
	}
	
}
