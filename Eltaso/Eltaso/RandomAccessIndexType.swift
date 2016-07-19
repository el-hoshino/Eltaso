//
//  RandomAccessIndexType.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension RandomAccessIndexType {
	
	var increased: Self {
		return self.advancedBy(1)
	}
	
	var decreased: Self {
		return self.advancedBy(-1)
	}
	
	mutating func increase(by n: Self.Distance = 1) {
		self = self.advancedBy(n)
	}
	
	mutating func decrease(by n: Self.Distance = 1) {
		self = self.advancedBy(-n)
	}
	
}
