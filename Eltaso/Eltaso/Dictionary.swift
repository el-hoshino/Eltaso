//
//  Dictionary.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Dictionary: EltasoCompatible {
	
	public var eltaso: Eltaso2AssociatedTypeContainer<Dictionary<Key, Value>, Key, Value> {
		return Eltaso2AssociatedTypeContainer(body: self)
	}
	
}

extension Eltaso2AssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public static func combine(_ a: Containee, with b: Containee, uniquingKeyWith combine: ((AssociatedType2, AssociatedType2) -> AssociatedType2) = { $1 }) -> Containee {
		
		return Containee.combine(a, with: b, uniquingKeyWith: combine)
		
	}
	
}

extension Eltaso2AssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public func containsKey(_ key: AssociatedType1) -> Bool {
		
		return self.body.containsKey(key)
		
	}
	
}

extension Eltaso2AssociatedTypeContainer where Containee == Dictionary<AssociatedType1, AssociatedType2> {
	
	public func dropping(_ key: AssociatedType1) -> Dictionary<AssociatedType1, AssociatedType2> {
		
		return self.body.dropping(key)
		
	}
	
	public static func drop(_ target: inout Dictionary<AssociatedType1, AssociatedType2>, with key: AssociatedType1) {
		
		target.drop(key: key)
		
	}
	
}

// MARK: - Internal methods
extension Dictionary {
	
	static func combine(_ a: Dictionary, with b: Dictionary, uniquingKeyWith combine: ((Value, Value) -> Value) = { $1 }) -> Dictionary {
		
		return a.merging(b, uniquingKeysWith: combine)
		
	}
	
}

extension Dictionary {
	
	func containsKey(_ key: Key) -> Bool {
		
		return self[key] != nil
		
	}
	
}

extension Dictionary {
	
	func dropping(_ key: Key) -> Dictionary {
		
		var dictionary = self
		dictionary.removeValue(forKey: key)
		
		return dictionary
		
	}
	
	mutating func drop(key: Key) {
		
		self = self.dropping(key)
		
	}
	
}
