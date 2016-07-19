//
//  Dictionary.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Dictionary {
	
	public init<S: SequenceType where S.Generator.Element == Element> (tuples seq: S) {
		self.init()
		for (k,v) in seq {
			self[k] = v
		}
	}
	
	public func dropping(key: Key) -> Dictionary<Key, Value> {
		var dictionary = self
		dictionary.removeValueForKey(key)
		return dictionary
	}
	
}
