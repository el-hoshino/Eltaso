//
//  String.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension String {
	
	public var localized: String {
		return NSLocalizedString(self, comment: "")
	}
	
	public func localized(inTable tableName: String, inBundle bundle: Bundle = .main, defaultValue value: String? = nil, comment: String = "") -> String {
		return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value ?? self, comment: comment)
	}
	
}

extension String {
	
	public mutating func keepFirst(_ n: Int = 1) {
		self = self.keepingFirst(n)
	}
	
	public mutating func keepLast(_ n: Int = 1) {
		self = self.keepingLast(n)
	}
	
}

extension String {
	
	public mutating func dropFirst(_ n: Int = 1) {
		self = self.droppingFirst(n)
	}
	
	public mutating func dropLast(_ n: Int = 1) {
		self = self.droppingLast(n)
	}
	
}

extension String {
	
	public func keepingFirst(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.startIndex, offsetBy: n, limitedBy: self.endIndex) ?? self.endIndex
		return self.substring(to: remainingIndex)
		
	}
	
	public func keepingLast(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.endIndex, offsetBy: -n, limitedBy: self.startIndex) ?? self.startIndex
		return self.substring(from: remainingIndex)
		
	}
	
}

extension String {

	public func droppingFirst(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.startIndex, offsetBy: n, limitedBy: self.endIndex) ?? self.endIndex
		return self.substring(from: remainingIndex)
		
	}
	
	public func droppingLast(_ n: Int = 1) -> String {
		
		let remainingIndex = self.characters.index(self.endIndex, offsetBy: -n, limitedBy: self.startIndex) ?? self.startIndex
		return self.substring(to: remainingIndex)
		
	}
	
}
