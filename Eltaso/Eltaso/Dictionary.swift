//
//  Dictionary.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Dictionary: EltasoCompatible {
	public var eltaso: EltasoDualAssociatedTypeContainer<Dictionary<Key, Value>, Key, Value> {
		return EltasoDualAssociatedTypeContainer(body: self)
	}
}

extension Dictionary {
	
	public static func + <Key, Value> (lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		var dictionary = lhs
		rhs.forEach { pair in
			dictionary[pair.key] = pair.value
		}
		return dictionary
	}
	
}

extension EltasoDualAssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public func containsKey(_ key: AssociatedType1) -> Bool {
		
		return self.body[key] != nil
		
	}
	
}

extension EltasoDualAssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public func dropping(_ key: AssociatedType1) -> Dictionary<AssociatedType1, AssociatedType2> {
		var dictionary = self.body
		dictionary.removeValue(forKey: key)
		return dictionary
	}
	
	public static func drop(_ key: AssociatedType1, in target: inout Dictionary<AssociatedType1, AssociatedType2>) {
		target = target.eltaso.dropping(key)
	}
	
}

