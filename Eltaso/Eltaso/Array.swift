//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Array: SequencedEltasoCompatible { }

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public var shuffled: Array<Element> {
		var array = self.body
		for i in array.indices.reversed().dropLast() {
			let j = Int.Eltaso.makeRandom(within: array.indices.lowerBound ..< i)
			array.swapAt(i, j)
		}
		return array
	}
	
	public static func shuffle(_ target: inout Array<Element>) {
		target = target.eltaso.shuffled
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public var randomElement: Element? {
		guard self.body.count > 0 else {
			return nil
		}
		let randomIndex = Int.Eltaso.makeRandom(within: self.body.indices)
		return self.body[randomIndex]
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public func appending(_ newElement: Element) -> Array<Element> {
		return self.body + [newElement]
	}
	
	public func appending(_ newElements: [Element]) -> Array<Element> {
		return self.body + newElements
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public static func append(_ newElements: [Element], to target: inout Array<Element>) {
		target += newElements
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public func keeping(at n: Int) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		return [self.body[n]]
	}
	
	public func keepingFirst(_ n: Int = 1) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[0 ..< n])
	}
	
	public func keepingLast(_ n: Int = 1) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[(self.body.count - n) ..< self.body.count])
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public static func keep(at n: Int, in target: inout Array<Element>) {
		target = target.eltaso.keeping(at: n)
	}
	
	public static func keepFirst(_ n: Int = 1, in target: inout Array<Element>) {
		target = target.eltaso.keepingFirst(n)
	}
	
	public static func keepLast(_ n: Int = 1, in target: inout Array<Element>) {
		target = target.eltaso.keepingLast(n)
	}
	
}

extension SequencedEltasoContainer where Containee == Array<Element> {
	
	public func removing(at n: Int) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		let result = self.body.enumerated().reduce([]) { (result, tuple) -> Array<Element> in
			return tuple.offset == n ? result : result.eltaso.appending(tuple.element)
		}
		return result
	}
	
	public func removingFirst(_ n: Int = 1) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[n ..< self.body.count])
	}
	
	public func removingLast(_ n: Int = 1) -> Array<Element> {
		let n = n.eltaso.limited(within: self.body.indices)
		return Array(self.body[0 ..< (self.body.count - n)])
	}
	
}

