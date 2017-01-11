//
//  MutableCollection.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/01/11.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import Foundation

extension MutableCollection {
	
	public var firstElement: Iterator.Element {
		get {
			return self[firstIndex]
		}
		set {
			self[firstIndex] = newValue
		}
	}
	
	public var lastElement: Iterator.Element {
		get {
			return self[lastIndex]
		}
		set {
			self[lastIndex] = newValue
		}
	}
	
}
