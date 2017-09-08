//
//  Sequence.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Eltaso1AssociatedTypeContainer where Containee: Sequence {
	
	public func flatten <T> (in type: T.Type) -> [T] {
		return self.body.flatten(in: type)
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee: Sequence, Containee.Element: OptionalType {

	public var flatten: [Containee.Element.WrappedType] {
		return self.body.flatten
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee: Sequence, Containee.Element: Sequence {

	public var flatten: [Containee.Element.Element] {
		return self.body.flatten
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee: Sequence {

	public func firstFlatMap <T> (_ transform: (Containee.Element) throws -> T?) rethrows -> T? {
		
		return try self.body.firstFlatMap(transform)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee: Sequence {

	public func group(condition: (_ previous: Containee.Element, _ next: Containee.Element) throws -> Bool) rethrows -> [[Containee.Element]] {
		
		return try self.body.group(condition: condition)
		
	}
	
}

extension Eltaso1AssociatedTypeContainer where Containee: Sequence {

	public func reduce(_ nextPartialResult: (_ previous: Containee.Element, _ next: Containee.Element) throws -> Containee.Element) rethrows -> Containee.Element? {
		
		return try self.body.reduce(nextPartialResult)
		
	}
	
}

// MARK: - Internal methods
extension Sequence {
	
	func flatten <T> (in type: T.Type) -> [T] {
		return self.flatMap { $0 as? T }
	}
	
}

extension Sequence where Element: OptionalType {
	
	var flatten: [Element.WrappedType] {
		return self.flatMap { $0.optinal }
	}
	
}

extension Sequence where Element: Sequence {
	
	var flatten: [Element.Element] {
		return self.flatMap { $0 }
	}
	
}

extension Sequence {
	
	func firstFlatMap <T> (_ transform: (Element) throws -> T?) rethrows -> T? {
		
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
	
	func group(condition: (_ previous: Element, _ next: Element) throws -> Bool) rethrows -> [[Element]] {
		
		var iterator = self.makeIterator()
		guard let first = iterator.next() else {
			return [[]]
		}
		
		var groupedArray: [[Element]] = [[first]]
		
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
	
	func reduce(_ nextPartialResult: (_ previous: Element, _ next: Element) throws -> Element) rethrows -> Element? {
		
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
