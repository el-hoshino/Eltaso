//
//  Strideable.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/09/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension EltasoContainer where Containee: Strideable {
	
	public var increased: Containee {
		return self.body.increased
	}
	
	public var decreased: Containee {
		return self.body.decreased
	}
	
	public func increased(by n: Containee.Stride) -> Containee {
		return self.body.increased(by: n)
	}
	
	public func decreased(by n: Containee.Stride) -> Containee {
		return self.body.decreased(by: n)
	}
	
	public static func increase(_ body: inout Containee, by n: Containee.Stride = 1) {
		body.increase(by: n)
	}
	
	public static func decrease(_ body: inout Containee, by n: Containee.Stride = 1) {
		body.decrease(by: n)
	}
	
}


// MARK: - Internal methods
extension Strideable {
	
	var increased: Self {
		return self.advanced(by: 1)
	}
	
	var decreased: Self {
		return self.advanced(by: -1)
	}
	
	func increased(by n: Self.Stride) -> Self {
		return self.advanced(by: n)
	}
	
	func decreased(by n: Self.Stride) -> Self {
		return self.advanced(by: -n)
	}
	
	mutating func increase(by n: Self.Stride = 1) {
		self = self.increased(by: n)
	}
	
	mutating func decrease(by n: Self.Stride = 1) {
		self = self.decreased(by: n)
	}
	
}
