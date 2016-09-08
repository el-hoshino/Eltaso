//
//  Array.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Array {
	
	public var second: Element? {
		if self.count > 1 {
			return self[1]
		} else {
			return nil
		}
	}
	
	public var shuffled: Array<Element> {
		var array = self
		for i in array.indices.reversed().dropLast() {
			let j = Int.createRandom(range: array.indices.lowerBound ..< i)
			(array[i], array[j]) = (array[j], array[i])
		}
		return array
	}
	
	public func appending(_ element: Element) -> Array<Element> {
		return self + [element]
	}
	
	public func appending(_ elements: [Element]) -> Array<Element> {
		return self + elements
	}
	
	public mutating func shuffle() {
		self = self.shuffled
	}
	
}
