//
//  Data.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Data {
	
	public enum PointerAdvanceSizeType {
		case byteSize
		case resultTypeSize
	}
	
	public func getValue <T> (at offset: Data.Index = 0, in advanceSizeType: PointerAdvanceSizeType = .byteSize) -> T? {
		
		let startIndex: Data.Index
		let endIndex: Data.Index
		
		switch advanceSizeType {
		case .byteSize:
			startIndex = self.index(self.startIndex, offsetBy: offset)
			endIndex = self.index(startIndex, offsetBy: MemoryLayout<T>.size)
			
		case .resultTypeSize:
			let advanceSize = MemoryLayout<T>.size
			startIndex = self.index(self.startIndex, offsetBy: offset * advanceSize)
			endIndex = self.index(startIndex, offsetBy: advanceSize)
			
		}
		
		guard self.indices.contains(startIndex) && self.indices.contains(endIndex) else {
			return nil
		}
		
		let result: T = self.withUnsafeBytes { UnsafeRawPointer($0).advanced(by: startIndex).assumingMemoryBound(to: T.self).pointee }
		
		return result
		
	}
	
	public func getUnsafeValue <T> (at offset: Data.Index = 0, in advanceSizeType: PointerAdvanceSizeType = .byteSize) -> T {
		
		switch advanceSizeType {
		case .byteSize:
			return self.withUnsafeBytes { UnsafeRawPointer($0).advanced(by: offset).assumingMemoryBound(to: T.self).pointee }
			
		case .resultTypeSize:
			return self.withUnsafeBytes { $0.advanced(by: offset).pointee }
		}
		
	}
	
	@available(*, deprecated: 3.0.5, message: "Use getValue(at:) -> T? or getUnsafeValue(at:) -> T instead")
	public func getSingleByte() -> UInt8 {
		
		let subdataRange: Range = self.startIndex ..< self.startIndex.increased(by: 1)
		let subdata = self.subdata(in: subdataRange)
		
		let result: UInt8 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	@available(*, deprecated: 3.0.5, message: "Use getValue(at:) -> T? or getUnsafeValue(at:) -> T instead")
	public func getDualByte() -> UInt16 {
		
		let subdataRange: Range = self.startIndex ..< self.startIndex.increased(by: 2)
		let subdata = self.subdata(in: subdataRange)
		
		let result: UInt16 = subdata.withUnsafeBytes { $0.pointee }
		
		return result
		
	}
	
	@available(*, deprecated: 3.0.5, message: "Use getValue(at:) -> T? or getUnsafeValue(at:) -> T instead")
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
