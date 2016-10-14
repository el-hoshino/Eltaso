//
//  Sequence.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Sequence {
	
	public func flatten <T> (in type: T.Type) -> [T] {
		return self.flatMap { $0 as? T }
	}
	
}

extension Sequence where Iterator.Element: OptionalType {
	
	public var flatten: [Iterator.Element.T] {
		return self.flatMap { $0.optionalValue }
	}
	
}

extension Sequence where Iterator.Element: Sequence {
	
	public var flatten: [Iterator.Element.Iterator.Element] {
		return self.flatMap { $0 }
	}
	
}
