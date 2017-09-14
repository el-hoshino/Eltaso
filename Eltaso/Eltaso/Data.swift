//
//  Data.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Data: EltasoCompatible {
	
	public var eltaso: EltasoContainer<Data> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == Data {
	
	public enum PointerAdvanceSizeType {
		case byteSize
		case resultTypeSize
	}
	
	public func getValue <T> (at offset: Data.Index = 0, by advanceSizeType: PointerAdvanceSizeType = .byteSize) -> T? {
		return self.body.getValue(at: offset, by: advanceSizeType)
	}
	
	public func getUnsafeValue <T> (at offset: Data.Index = 0, by advanceSizeType: PointerAdvanceSizeType = .byteSize) -> T {
		return self.body.getUnsafeValue(at: offset, by: advanceSizeType)
	}
	
}

extension EltasoContainer where Containee == Data {
	
	public static func append(_ byte: UInt8, to target: inout Containee) {
		target.append(byte)
	}
	
	public static func append(_ dualByte: UInt16, to target: inout Containee) {
		target.append(dualByte)
	}
	
	public static func append(_ quadByte: UInt32, to target: inout Containee) {
		target.append(quadByte)
	}
	
}

extension EltasoContainer where Containee == Data {
	
	public static func append(_ data: Data, to target: inout Containee) {
		target.append(data)
	}
	
}

// MARK: - Internal methods
extension Data {
	
	func getValue <T> (at offset: Data.Index = 0, by advanceSizeType: EltasoContainer<Data>.PointerAdvanceSizeType = .byteSize) -> T? {
		
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
	
	func getUnsafeValue <T> (at offset: Data.Index = 0, by advanceSizeType: EltasoContainer<Data>.PointerAdvanceSizeType = .byteSize) -> T {
		
		switch advanceSizeType {
		case .byteSize:
			return self.withUnsafeBytes { UnsafeRawPointer($0).advanced(by: offset).assumingMemoryBound(to: T.self).pointee }
			
		case .resultTypeSize:
			return self.withUnsafeBytes { $0.advanced(by: offset).pointee }
		}
		
	}
	
}

extension Data {
	
	mutating func append(_ byte: UInt8) {
		
		var byte = byte
		let pointer = UnsafeBufferPointer(start: &byte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
	mutating func append(_ dualByte: UInt16) {
		
		var dualByte = dualByte
		let pointer = UnsafeBufferPointer(start: &dualByte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
	mutating func append(_ quadByte: UInt32) {
		
		var quadByte = quadByte
		let pointer = UnsafeBufferPointer(start: &quadByte, count: 1)
		let data = Data(buffer: pointer)
		
		self.append(data)
		
	}
	
}
