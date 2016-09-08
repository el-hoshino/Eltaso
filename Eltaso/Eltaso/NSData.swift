//
//  NSData.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension Data {
	
	public func getSingleByte() -> UInt8 {
		var byte: UInt8 = 0
		(self as NSData).getBytes(&byte, length: 1)
		return byte
	}
	
	public func getDualByte() -> UInt16 {
		var dualByte: UInt16 = 0
		(self as NSData).getBytes(&dualByte, length: 2)
		return dualByte
	}
	
	public func getQuadByte() -> UInt32 {
		var quadByte: UInt32 = 0
		(self as NSData).getBytes(&quadByte, length: 4)
		return quadByte
	}
	
}
