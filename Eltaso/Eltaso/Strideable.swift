//
//  Strideable.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/09/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Strideable {
	
	public var increased: Self {
		return self.advanced(by: 1)
	}
	
	public var decreased: Self {
		return self.advanced(by: -1)
	}
	
	public func increased(by n: Self.Stride) -> Self {
		return self.advanced(by: n)
	}
	
	public func decreased(by n: Self.Stride) -> Self {
		return self.advanced(by: -n)
	}
	
	public mutating func increase(by n: Self.Stride = 1) {
		self = self.increased(by: n)
	}
	
	public mutating func decrease(by n: Self.Stride = 1) {
		self = self.decreased(by: n)
	}
	
}
