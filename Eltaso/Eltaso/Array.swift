//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Array {
	
	public var indexRange: Range<Int> {
		return self.startIndex ..< self.endIndex
	}
	
}
