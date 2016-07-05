//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGRect {
	
	var top: CGFloat {
		return self.origin.y
	}
	
	var bottom: CGFloat {
		return self.origin.y + self.height
	}
	
	var left: CGFloat {
		return self.origin.x
	}
	
	var right: CGFloat {
		return self.origin.x + self.width
	}
	
}
