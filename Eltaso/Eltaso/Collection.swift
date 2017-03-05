//
//  Collection.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/09/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Collection where Self: RandomAccessCollection {
	
	public var second: Self.Iterator.Element? {
		
		guard let secondIndex = self.index(self.startIndex, offsetBy: 1, limitedBy: self.index(before: self.endIndex)) else {
			return nil
		}
		
		return self[secondIndex]
		
	}
	
}

extension Collection {
	
	public var firstIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.startIndex
	}
	
}

extension Collection {
	
	public var firstElement: Iterator.Element {
		get {
			return self[firstIndex]
		}
	}
	
}

extension Collection where Self: MutableCollection {
	
	public var firstElement: Iterator.Element {
		get {
			return self[firstIndex]
		}
		set {
			self[firstIndex] = newValue
		}
	}
	
}

extension Collection where Self: BidirectionalCollection {
	
	public var lastIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.index(before: self.endIndex)
	}
	
}

extension Collection where Self: BidirectionalCollection {
	
	public var lastElement: Iterator.Element {
		get {
			return self[lastIndex]
		}
	}
	
}

extension Collection where Self: BidirectionalCollection, Self: MutableCollection {
	
	public var lastElement: Iterator.Element {
		get {
			return self[lastIndex]
		}
		set {
			self[lastIndex] = newValue
		}
	}
	
}
