//
//  String.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension String: EltasoCompatible {
	public var eltaso: EltasoContainer<String> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == String {
	
	public var localized: Containee {
		return NSLocalizedString(self.body, comment: "")
	}
	
	public func localized(inTable tableName: Containee, inBundle bundle: Bundle = .main, defaultValue value: Containee? = nil, comment: Containee = "") -> Containee {
		return NSLocalizedString(self.body, tableName: tableName, bundle: bundle, value: value ?? self.body, comment: comment)
	}
	
}

extension EltasoContainer where Containee == String {
	
	public func keepingFirst(_ n: Int = 1) -> Containee {
		
		let remainingIndex = self.body.index(self.body.startIndex, offsetBy: n, limitedBy: self.body.endIndex) ?? self.body.endIndex
		let remainedText = self.body.substring(to: remainingIndex)
		return remainedText
		
	}
	
	public func keepingLast(_ n: Int = 1) -> Containee {
		
		let remainingIndex = self.body.index(self.body.endIndex, offsetBy: -n, limitedBy: self.body.startIndex) ?? self.body.startIndex
		let remainedText = self.body.substring(from: remainingIndex)
		return remainedText
		
	}
	
	public static func keepFirst(_ n: Int = 1, in target: inout Containee) {
		target = target.eltaso.keepingFirst(n)
	}
	
	public static func keepLast(_ n: Int = 1, in target: inout Containee) {
		target = target.eltaso.keepingLast(n)
	}
	
}

extension EltasoContainer where Containee == String {

	public func droppingFirst(_ n: Int = 1) -> Containee {
		
		let remainingIndex = self.body.index(self.body.startIndex, offsetBy: n, limitedBy: self.body.endIndex) ?? self.body.endIndex
		let remainedText = self.body.substring(from: remainingIndex)
		return remainedText
		
	}
	
	public func droppingLast(_ n: Int = 1) -> Containee {
		
		let remainingIndex = self.body.index(self.body.endIndex, offsetBy: -n, limitedBy: self.body.startIndex) ?? self.body.startIndex
		let remainedText = self.body.substring(to: remainingIndex)
		return remainedText
		
	}
	
	public static func dropFirst(_ n: Int, in target: inout Containee) {
		target = target.eltaso.droppingFirst(n)
	}
	
	public static func dropLast(_ n: Int, in target: inout Containee) {
		target = target.eltaso.droppingLast(n)
	}
	
}

extension EltasoContainer where Containee == String {
	
	private func emptyElementsFiltered(from array: [Containee]) -> [Containee] {
		
		let filtered = array.filter({ (component) -> Bool in
			return !component.isEmpty
		})
		return filtered
		
	}
	
	public func components(separatedBy separator: String, allowingEmptyComponent: Bool) -> [Containee] {
		
		let components = self.body.components(separatedBy: separator)
		
		if allowingEmptyComponent {
			return components
		}
		else {
			let filtered = self.emptyElementsFiltered(from: components)
			return filtered
		}
		
	}
	
	public func components(separatedBy separator: CharacterSet, allowingEmptyComponent: Bool) -> [Containee] {
		
		let components = self.body.components(separatedBy: separator)
		
		if allowingEmptyComponent {
			return components
		}
		else {
			let filtered = self.emptyElementsFiltered(from: components)
			return filtered
		}
		
	}
	
}
