//
//  Collection.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/09/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension EltasoContainer where Containee: RandomAccessCollection {
	
	public var second: Containee.Element? {
		
		return self.body.second
		
	}
	
}

extension EltasoContainer where Containee: Collection {
	
	public var firstIndex: Containee.Index {
		return self.body.firstIndex
	}
	
}

extension EltasoContainer where Containee: Collection {
	
	public var firstElement: Containee.Element {
		get {
			return self.body.firstElement
		}
	}
	
}

extension EltasoContainer where Containee: BidirectionalCollection {
	
	public var lastIndex: Containee.Index {
		return self.body.lastIndex
	}
	
}

extension EltasoContainer where Containee: BidirectionalCollection {
	
	public var lastElement: Containee.Element {
		get {
			return self.body.lastElement
		}
	}
	
}


// MARK: - Internal methods
extension Collection where Self: RandomAccessCollection {
	
	var second: Element? {
		
		guard let secondIndex = self.index(self.startIndex, offsetBy: 1, limitedBy: self.index(before: self.endIndex)) else {
			return nil
		}
		
		return self[secondIndex]
		
	}
	
}

extension Collection {
	
	var firstIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.startIndex
	}
	
	var firstElement: Element {
		get {
			return self[self.firstIndex]
		}
	}
	
}

extension Collection where Self: MutableCollection {
	
	var firstElement: Element {
		get {
			return self[self.firstIndex]
		}
		set {
			self[self.firstIndex] = newValue
		}
	}
	
}

extension Collection where Self: BidirectionalCollection {
	
	var lastIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.index(before: self.endIndex)
	}
	
	var lastElement: Element {
		get {
			return self[self.lastIndex]
		}
	}
	
}

extension Collection where Self: MutableCollection, Self: BidirectionalCollection {
	
	var lastElement: Element {
		get {
			return self[self.lastIndex]
		}
		set {
			self[self.lastIndex] = newValue
		}
	}
	
}
