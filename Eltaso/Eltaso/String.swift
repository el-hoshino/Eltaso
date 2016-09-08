//
//  String.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension String {
	
	public func droppingFirst(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.startIndex, offsetBy: n, limitedBy: self.endIndex)
		return self.substring(from: remainingIndex)
		
	}
	
	public func droppingLast(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.endIndex, offsetBy: -n, limitedBy: self.startIndex)
		return self.substring(to: remainingIndex)
		
	}
	
}
