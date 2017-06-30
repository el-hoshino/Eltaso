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

extension EltasoDualAssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public static func combine(_ a: Containee, with b: Containee, uniquingKeyWith combine: ((AssociatedType2, AssociatedType2) -> AssociatedType2) = { $1 }) -> Containee {
		
		return a.merging(b.map { $0 }, uniquingKeysWith: combine)
		
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

