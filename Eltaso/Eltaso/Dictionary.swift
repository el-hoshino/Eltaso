//
//  Dictionary.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Dictionary {
	
	public func containsKey(_ key: Key) -> Bool {
		
		return self[key] != nil
		
	}
	
}

extension Dictionary {
	
	public func dropping(_ key: Key) -> Dictionary<Key, Value> {
		var dictionary = self
		dictionary.removeValue(forKey: key)
		return dictionary
	}
	
	public mutating func drop(_ key: Key) {
		self = self.dropping(key)
	}
	
}

public func + <Key, Value> (lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
	var dictionary = lhs
	rhs.forEach { pair in
		dictionary[pair.key] = pair.value
	}
	return dictionary
}
