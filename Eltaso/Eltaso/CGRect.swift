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
		return self.origin.y
	}
	
	public var bottom: CGFloat {
		return self.origin.y + self.height
	}
	
	public var left: CGFloat {
		return self.origin.x
	}
	
	public var right: CGFloat {
		return self.origin.x + self.width
	}
	
}
