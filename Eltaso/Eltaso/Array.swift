//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Array: EltasoCompatible {
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public var shuffled: Array<AssociatedType> {
		
		return self.body.shuffled
		
	}
	
	public static func shuffle(_ target: inout Array<AssociatedType>) {
		
		target.shuffle()
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public var random: AssociatedType? {
		
		return self.body.random
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public subscript (optional offset: Int) -> AssociatedType? {
		
		return self.body[optional: offset]
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func appending(_ newElement: AssociatedType) -> Array<AssociatedType> {
		
		return self.body.appending(newElement)
		
	}
	
	public func appending(_ newElements: [AssociatedType]) -> Array<AssociatedType> {
		
		return self.body.appending(newElements)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public static func append(_ target: inout Array<AssociatedType>, with newElements: [AssociatedType]) {
		
		target.append(newElements)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func keeping(at n: Int) -> Array<AssociatedType> {
		
		return self.body.keeping(at: n)
		
	}
	
	public func keepingFirst(_ n: Int = 1) -> Array<AssociatedType> {
		
		return self.body.keepingFirst(n)
		
	}
	
	public func keepingLast(_ n: Int = 1) -> Array<AssociatedType> {
		
		return self.body.keepingLast(n)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public static func keep(at n: Int, in target: inout Array<AssociatedType>) {
		
		target.keep(at: n)
		
	}
	
	public static func keepFirst(_ n: Int = 1, in target: inout Array<AssociatedType>) {
		
		target.keepFirst(n)
		
	}
	
	public static func keepLast(_ n: Int = 1, in target: inout Array<AssociatedType>) {
		
		target.keepLast(n)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func removing(at n: Int) -> Array<AssociatedType> {
		
		return self.body.removing(at: n)
		
	}
	
	public func removingFirst(_ n: Int = 1) -> Array<AssociatedType> {
		
		return self.body.removingFirst(n)
		
	}
	
	public func removingLast(_ n: Int = 1) -> Array<AssociatedType> {
		
		return self.body.removingLast(n)
		
	}
	
}


// MARK: - Internal methods
extension Array {
	
	var shuffled: Array {
		
		var array = self
		for i in array.indices.reversed().dropLast() {
			let j = Int.makeRandom(within: array.indices.lowerBound ..< i)
			array.swapAt(i, j)
		}
		
		return array
		
	}
	
	mutating func shuffle() {
		
		self = self.shuffled
		
	}
	
}

extension Array {
	
	var random: Element? {
		
		guard self.count > 0 else {
			return nil
		}
		let randomIndex = Int.makeRandom(within: self.indices)
		
		return self[randomIndex]
		
	}
	
}

extension Array {
	
	subscript (optional offset: Int) -> Element? {
		
		return self.suffix(from: offset).first
		
	}
	
}

extension Array {
	
	func appending(_ newElement: Element) -> Array {
		
		return self + [newElement]
		
	}
	
	func appending(_ newElements: [Element]) -> Array {
		
		return self + newElements
		
	}
	
}

extension Array {
	
	mutating func append(_ newElements: [Element]) {
		
		self += newElements
		
	}
	
}

extension Array {
	
	func keeping(at n: Int) -> Array {
		
		let n = n.limited(within: self.indices)
		
		return [self[n]]
		
	}
	
	func keepingFirst(_ n: Int = 1) -> Array {
		
		let n = n.limited(within: self.indices)
		
		return Array(self[0 ..< n])
		
	}
	
	func keepingLast(_ n: Int = 1) -> Array {
		
		let n = n.limited(within: self.indices)
		
		return Array(self[(self.count - n) ..< self.count])
		
	}
	
}

extension Array {
	
	mutating func keep(at n: Int) {
		
		self = self.keeping(at: n)
		
	}
	
	mutating func keepFirst(_ n: Int = 1) {
		
		self = self.keepingFirst(n)
		
	}
	
	mutating func keepLast(_ n: Int = 1) {
		
		self = self.keepingLast(n)
		
	}
	
}

extension Array {
	
	public func removing(at n: Int) -> Array {
		
		let n = n.limited(within: self.indices)
		let result = self.enumerated().reduce([]) { (result, tuple) -> Array in
			return tuple.offset == n ? result : result.appending(tuple.element)
		}
		
		return result
		
	}
	
	public func removingFirst(_ n: Int = 1) -> Array {
		
		let n = n.limited(within: self.indices)
		
		return Array(self[n ..< self.count])
		
	}
	
	public func removingLast(_ n: Int = 1) -> Array {
		
		let n = n.limited(within: self.indices)
		
		return Array(self[0 ..< (self.count - n)])
		
	}
	
}
