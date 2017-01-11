//
//  Collection.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/09/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Collection {
	
	public var second: Self.Iterator.Element? {
		
		let secondIndex = self.index(self.startIndex, offsetBy: 1)
		
		if self.distance(from: secondIndex, to: self.endIndex) > 0 {
			return self[secondIndex]
			
		} else {
			return nil
			
		}
		
	}
	
}

extension Collection {
	
	public var firstIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.startIndex
	}
	
	public var lastIndex: Index {
		guard self.count > 0 else {
			fatalError("Index out of range")
		}
		return self.index(self.endIndex, offsetBy: -1)
	}
	
}

extension Collection {
	
	public var firstElement: Iterator.Element {
		get {
			return self[firstIndex]
		}
	}
	
	public var lastElement: Iterator.Element {
		get {
			return self[lastIndex]
		}
	}
	
}
