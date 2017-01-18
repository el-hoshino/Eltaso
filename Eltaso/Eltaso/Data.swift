//
//  Data.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Data {
	
	public func getSingleByte(at offset: Int = 0) -> UInt8? {
		
		guard let startIndex = self.index(self.startIndex, offsetBy: offset, limitedBy: self.endIndex) else {
			return nil
		}
		guard let endIndex = self.index(startIndex, offsetBy: 1, limitedBy: self.endIndex) else {
			return nil
		}
		let subdata = self.subdata(in: startIndex ..< endIndex)
		
		let result: UInt8 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	public func getDualByte(at offset: Int = 0) -> UInt16? {
		
		guard let startIndex = self.index(self.startIndex, offsetBy: offset, limitedBy: self.endIndex) else {
			return nil
		}
		guard let endIndex = self.index(startIndex, offsetBy: 2, limitedBy: self.endIndex) else {
			return nil
		}
		let subdata = self.subdata(in: startIndex ..< endIndex)
		
		let result: UInt16 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	public func getQuadByte(at offset: Int = 0) -> UInt32? {
		
		guard let startIndex = self.index(self.startIndex, offsetBy: offset, limitedBy: self.endIndex) else {
			return nil
		}
		guard let endIndex = self.index(startIndex, offsetBy: 4, limitedBy: self.endIndex) else {
			return nil
		}
		let subdata = self.subdata(in: startIndex ..< endIndex)
		
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
