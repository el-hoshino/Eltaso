//
//  Bool.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Bool {
	
	static func createRandom() -> Bool {
		let randomNumber = Int.createRandom(range: 0 ... 1)
		return randomNumber != 0
	}
	
	var negated: Bool {
		return !self
	}
	
	mutating public func negate() {
		self = self.negated
	}
	
}
