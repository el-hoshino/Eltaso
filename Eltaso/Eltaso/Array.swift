//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Array: EltasoCompatible {
	public var eltaso: EltasoSingleAssociatedTypeContainer<Array<Element>, Element> {
		return EltasoSingleAssociatedTypeContainer(body: self)
	}
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public var shuffled: Array<AssociatedType> {
		var array = self.body
		for i in array.indices.reversed().dropLast() {
			let j = Int.Eltaso.makeRandom(within: array.indices.lowerBound ..< i)
			array.swapAt(i, j)
		}
		return array
	}
	
	public static func shuffle(_ target: inout Array<AssociatedType>) {
		target = target.eltaso.shuffled
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public var randomElement: AssociatedType? {
		guard self.body.count > 0 else {
			return nil
		}
		let randomIndex = Int.Eltaso.makeRandom(within: self.body.indices)
		return self.body[randomIndex]
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public subscript (optional offset: Int) -> AssociatedType? {
		
		return self.body.suffix(from: offset).first
		
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func appending(_ newElement: AssociatedType) -> Array<AssociatedType> {
		return self.body + [newElement]
	}
	
	public func appending(_ newElements: [AssociatedType]) -> Array<AssociatedType> {
		return self.body + newElements
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public static func append(_ newElements: [AssociatedType], to target: inout Array<AssociatedType>) {
		target += newElements
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func keeping(at n: Int) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		return [self.body[n]]
	}
	
	public func keepingFirst(_ n: Int = 1) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[0 ..< n])
	}
	
	public func keepingLast(_ n: Int = 1) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[(self.body.count - n) ..< self.body.count])
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public static func keep(at n: Int, in target: inout Array<AssociatedType>) {
		target = target.eltaso.keeping(at: n)
	}
	
	public static func keepFirst(_ n: Int = 1, in target: inout Array<AssociatedType>) {
		target = target.eltaso.keepingFirst(n)
	}
	
	public static func keepLast(_ n: Int = 1, in target: inout Array<AssociatedType>) {
		target = target.eltaso.keepingLast(n)
	}
	
}

extension EltasoSingleAssociatedTypeContainer where Containee == Array<AssociatedType> {
	
	public func removing(at n: Int) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		let result = self.body.enumerated().reduce([]) { (result, tuple) -> Array<AssociatedType> in
			return tuple.offset == n ? result : result.eltaso.appending(tuple.element)
		}
		return result
	}
	
	public func removingFirst(_ n: Int = 1) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[n ..< self.body.count])
	}
	
	public func removingLast(_ n: Int = 1) -> Array<AssociatedType> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[0 ..< (self.body.count - n)])
	}
	
}

