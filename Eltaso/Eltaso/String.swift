//
//  String.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension String: EltasoCompatible {
	
	public var eltaso: EltasoContainer<String> {
		return EltasoContainer(body: self)
	}

}

extension EltasoContainer where Containee == String {
	
	public var localized: Containee {
		return self.body.localized
	}
	
	public func localized(inTable tableName: Containee, inBundle bundle: Bundle = .main, defaultValue value: Containee? = nil, comment: Containee = "") -> Containee {
		return self.body.localized(inTable: tableName, inBundle: bundle, defaultValue: value, comment: comment)
	}
	
}

extension EltasoContainer where Containee == String {
	
	public func keepingFirst(_ n: Int = 1) -> Containee {
		return self.body.keepingFirst(n)
	}
	
	public func keepingLast(_ n: Int = 1) -> Containee {
		return self.body.keepingLast(n)
	}
	
	public static func keepFirst(_ n: Int = 1, in target: inout Containee) {
		target.keepFirst(n)
	}
	
	public static func keepLast(_ n: Int = 1, in target: inout Containee) {
		target.keepLast(n)
	}
	
}

extension EltasoContainer where Containee == String {

	public func droppingFirst(_ n: Int = 1) -> Containee {
		return self.body.droppingFirst(n)
	}
	
	public func droppingLast(_ n: Int = 1) -> Containee {
		return self.body.droppingLast(n)
	}
	
	public static func dropFirst(_ n: Int, in target: inout Containee) {
		target.dropFirst(n)
	}
	
	public static func dropLast(_ n: Int, in target: inout Containee) {
		target.dropLast(n)
	}
	
}

extension EltasoContainer where Containee == String {
	
	public func components(separatedBy separator: String, allowingEmptyComponent: Bool) -> [Containee] {
		return self.body.components(separatedBy: separator, allowingEmptyComponent: allowingEmptyComponent)
	}
	
	public func components(separatedBy separator: CharacterSet, allowingEmptyComponent: Bool) -> [Containee] {
		return self.body.components(separatedBy: separator, allowingEmptyComponent: allowingEmptyComponent)
	}
	
}

// MARK: - Internal methods
extension String {
	
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
	
	func localized(inTable tableName: String, inBundle bundle: Bundle = .main, defaultValue value: String? = nil, comment: String = "") -> String {
		return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value ?? self, comment: comment)
	}
	
}

extension String {
	
	func keepingFirst(_ n: Int = 1) -> String {
		
		let remainingIndex = self.index(self.startIndex, offsetBy: n, limitedBy: self.endIndex) ?? self.endIndex
		let remainedText = String(self[..<remainingIndex])
		return remainedText
		
	}
	
	func keepingLast(_ n: Int = 1) -> String {
		
		let remainingIndex = self.index(self.endIndex, offsetBy: -n, limitedBy: self.startIndex) ?? self.startIndex
		let remainedText = String(self[remainingIndex...])
		return remainedText
		
	}
	
	mutating func keepFirst(_ n: Int = 1) {
		self = self.keepingFirst(n)
	}
	
	mutating func keepLast(_ n: Int = 1) {
		self = self.keepingLast(n)
	}
	
}

extension String {
	
	func droppingFirst(_ n: Int = 1) -> String {
		
		let remainingIndex = self.index(self.startIndex, offsetBy: n, limitedBy: self.endIndex) ?? self.endIndex
		let remainedText = String(self[remainingIndex...])
		return remainedText
		
	}
	
	func droppingLast(_ n: Int = 1) -> String {
		
		let remainingIndex = self.index(self.endIndex, offsetBy: -n, limitedBy: self.startIndex) ?? self.startIndex
		let remainedText = String(self[..<remainingIndex])
		return remainedText
		
	}
	
	mutating func dropFirst(_ n: Int) {
		self = self.droppingFirst(n)
	}
	
	mutating func dropLast(_ n: Int) {
		self = self.droppingLast(n)
	}
	
}

extension String {
	
	private func emptyElementsFiltered(from array: [String]) -> [String] {
		
		let filtered = array.filter({ (component) -> Bool in
			return !component.isEmpty
		})
		return filtered
		
	}
	
	func components(separatedBy separator: String, allowingEmptyComponent: Bool) -> [String] {
		
		let components = self.components(separatedBy: separator)
		
		if allowingEmptyComponent {
			return components
		}
		else {
			let filtered = self.emptyElementsFiltered(from: components)
			return filtered
		}
		
	}
	
	func components(separatedBy separator: CharacterSet, allowingEmptyComponent: Bool) -> [String] {
		
		let components = self.components(separatedBy: separator)
		
		if allowingEmptyComponent {
			return components
		}
		else {
			let filtered = self.emptyElementsFiltered(from: components)
			return filtered
		}
		
	}
	
}
