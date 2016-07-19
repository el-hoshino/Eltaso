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
		
		var token = self
		let removingRange = token.startIndex ..< token.startIndex.advancedBy(n)
		token.removeRange(removingRange)
		return token
		
	}
	
}
