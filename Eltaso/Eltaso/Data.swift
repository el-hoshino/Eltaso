//
//  Data.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Data {
	
	public func getSingleByte() -> UInt8 {
		
		let subdataRange: Range = self.startIndex ..< self.startIndex.increased(by: 1)
		let subdata = self.subdata(in: subdataRange)
		
		let result: UInt8 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	public func getDualByte() -> UInt16 {
		
		let subdataRange: Range = self.startIndex ..< self.startIndex.increased(by: 2)
		let subdata = self.subdata(in: subdataRange)
		
		let result: UInt16 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	public func getQuadByte() -> UInt32 {
		
		let subdataRange: Range = self.startIndex ..< self.startIndex.increased(by: 4)
		let subdata = self.subdata(in: subdataRange)
		
		let result: UInt32 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
}

extension Data {
	
	public mutating func appendSingleByte(_ byte: UInt8) {
		
		var byte = byte
		let pointer = UnsafeBufferPointer(start: &byte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
	public mutating func appendDualByte(_ dualByte: UInt16) {
		
		var dualByte = dualByte
		let pointer = UnsafeBufferPointer(start: &dualByte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
	public mutating func appendQuadByte(_ quadByte: UInt32) {
		
		var quadByte = quadByte
		let pointer = UnsafeBufferPointer(start: &quadByte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
}
