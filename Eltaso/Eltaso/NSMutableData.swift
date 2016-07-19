//
//  NSMutableData.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension NSMutableData {
	
	public func removeLast(n: Int = 1) {
		let range = NSMakeRange(self.length - n, n)
		self.replaceBytesInRange(range, withBytes: nil, length: 0)
	}
	
	public func appendByte(byte: UInt8) {
		var byte = byte
		self.appendBytes(&byte, length: 1)
	}
	
	public func appendDualByte(dualByte: UInt16) {
		var dualByte = dualByte
		self.appendBytes(&dualByte, length: 2)
	}
	
	public func appendQuadByte(quadByte: UInt32) {
		var quadByte = quadByte
		self.appendBytes(&quadByte, length: 4)
	}
	
}
