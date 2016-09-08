//
//  NSMutableData.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension NSMutableData {
	
	public func removeLast(_ n: Int = 1) {
		let range = NSMakeRange(self.length - n, n)
		self.replaceBytes(in: range, withBytes: nil, length: 0)
	}
	
	public func appendByte(_ byte: UInt8) {
		var byte = byte
		self.append(&byte, length: 1)
	}
	
	public func appendDualByte(_ dualByte: UInt16) {
		var dualByte = dualByte
		self.append(&dualByte, length: 2)
	}
	
	public func appendQuadByte(_ quadByte: UInt32) {
		var quadByte = quadByte
		self.append(&quadByte, length: 4)
	}
	
}
