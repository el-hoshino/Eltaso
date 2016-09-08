//
//  SequenceType.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Sequence {
	
	func flatten <T> (in type: T.Type) -> [T] {
		return self.flatMap { $0 as? T }
	}
	
}

public extension Sequence where Iterator.Element: OptionalType {
	
	var flatten: [Iterator.Element.T] {
		return self.flatMap { $0.optionalValue }
	}
	
}
