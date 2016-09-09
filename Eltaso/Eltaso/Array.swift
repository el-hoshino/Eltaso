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
