//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Array {
	
	public var shuffled: Array<Element> {
		var array = self
		for i in array.indices.reversed().dropLast() {
			let j = Int.createRandom(range: array.indices.lowerBound ..< i)
			(array[i], array[j]) = (array[j], array[i])
		}
		return array
	}
	
	public mutating func shuffle() {
		self = self.shuffled
	}
	
}

extension Array {
	
	public func appending(_ element: Element) -> Array<Element> {
		return self + [element]
	}
	
	public func appending(_ elements: [Element]) -> Array<Element> {
		return self + elements
	}
	
}

extension Array {
	
	public func keepingFirst(_ n: Int = 1) -> Array<Element> {
		let n = Swift.min(n, self.count)
		return n > 0 ? Array(self[0 ..< n]) : []
	}
	
	public func keepingLast(_ n: Int = 1) -> Array<Element> {
		let n = Swift.min(n, self.count)
		return n > 0 ? Array(self[(self.count - n) ..< self.count]) : []
	}
	
}

extension Array {
	
	public func droppingFirst(_ n: Int = 1) -> Array<Element> {
		let n = Swift.min(n, self.count)
		return n > 0 ? Array(self[n ..< self.count]) : self
	}
	
	public func droppingLast(_ n: Int = 1) -> Array<Element> {
		let n = Swift.min(n, self.count)
		return n > 0 ? Array(self[0 ..< (self.count - n)]) : self
	}
	
}
