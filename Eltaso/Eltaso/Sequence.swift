//
//  Sequence.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Sequence {
	
	public func flatten <T> (in type: T.Type) -> [T] {
		return self.flatMap { $0 as? T }
	}
	
}

extension Sequence where Iterator.Element == Optional<Any> {
	
	public var flatten: [Element] {
		return self.flatMap { $0 }
	}
	
}

extension Sequence where Iterator.Element: Sequence {
	
	public var flatten: [Element.Element] {
		return self.flatMap { $0 }
	}
	
}

extension Sequence {
	
	public func firstFlatMap <T> (_ transform: (Iterator.Element) throws -> T?) rethrows -> T? {
		
		var iterator = self.makeIterator()
		
		while let next = iterator.next() {
			if let transformed = try transform(next) {
				return transformed
			}
		}
		
		return nil
		
	}
	
}

extension Sequence {
	
	public func group(condition: (_ previous: Iterator.Element, _ next: Iterator.Element) throws -> Bool) rethrows -> [[Iterator.Element]] {
		
		var iterator = self.makeIterator()
		guard let first = iterator.next() else {
			return [[]]
		}
		
		var groupedArray: [[Iterator.Element]] = [[first]]
		
		while let next = iterator.next() {
			let previous = groupedArray.lastElement.lastElement
			
			if try condition(previous, next) == true {
				groupedArray.lastElement.append(next)
				
			} else {
				groupedArray.append([next])
			}
			
		}
		
		return groupedArray
		
	}
	
}

extension Sequence {
	
	public func reduce(_ nextPartialResult: (_ previous: Iterator.Element, _ next: Iterator.Element) throws -> Iterator.Element) rethrows -> Iterator.Element? {
		
		var iterator = self.makeIterator()
		guard let first = iterator.next() else {
			return nil
		}
		
		var result = first
		while let next = iterator.next() {
			result = try nextPartialResult(result, next)
		}
		
		return result
		
	}
	
}
