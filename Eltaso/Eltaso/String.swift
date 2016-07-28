//
//  String.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension String {
	
	public func droppingFirst(n: Int = 1) -> String {
		
		let remainingIndex = self.startIndex.advancedBy(n, limit: self.endIndex)
		return self.substringFromIndex(remainingIndex)
		
	}
	
	public func droppingLast(n: Int = 1) -> String {
		
		let remainingIndex = self.endIndex.advancedBy(-n, limit: self.startIndex)
		return self.substringToIndex(remainingIndex)
		
	}
	
}
