//
//  Data.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

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
		
		let startIndex: Containee.Index
		let endIndex: Containee.Index
		
		switch advanceSizeType {
		case .byteSize:
			startIndex = self.body.index(self.body.startIndex, offsetBy: offset)
			endIndex = self.body.index(startIndex, offsetBy: MemoryLayout<T>.size)
			
		case .resultTypeSize:
			let advanceSize = MemoryLayout<T>.size
			startIndex = self.body.index(self.body.startIndex, offsetBy: offset * advanceSize)
			endIndex = self.body.index(startIndex, offsetBy: advanceSize)
			
		}
		
		guard self.body.indices.contains(startIndex) && self.body.indices.contains(endIndex) else {
			return nil
		}
		
		let result: T = self.body.withUnsafeBytes { UnsafeRawPointer($0).advanced(by: startIndex).assumingMemoryBound(to: T.self).pointee }
		
		return result
		
	}
	
	public func getUnsafeValue <T> (at offset: Data.Index = 0, by advanceSizeType: PointerAdvanceSizeType = .byteSize) -> T {
		
		switch advanceSizeType {
		case .byteSize:
			return self.body.withUnsafeBytes { UnsafeRawPointer($0).advanced(by: offset).assumingMemoryBound(to: T.self).pointee }
			
		case .resultTypeSize:
			return self.body.withUnsafeBytes { $0.advanced(by: offset).pointee }
		}
		
	}
	
}

extension EltasoContainer where Containee == Data {
	
	public static func append(_ byte: UInt8, to target: inout Containee) {
		
		var byte = byte
		let pointer = UnsafeBufferPointer(start: &byte, count: 1)
		let data = Containee(buffer: pointer)
		
		target.append(data)
		
	}
	
	public static func append(_ dualByte: UInt16, to target: inout Containee) {
		
		var dualByte = dualByte
		let pointer = UnsafeBufferPointer(start: &dualByte, count: 1)
		let data = Containee(buffer: pointer)
		
		target.append(data)
		
	}
	
	public static func append(_ quadByte: UInt32, to target: inout Containee) {
		
		var quadByte = quadByte
		let pointer = UnsafeBufferPointer(start: &quadByte, count: 1)
		let data = Containee(buffer: pointer)
		
		target.append(data)
		
	}
	
}

extension EltasoContainer where Containee == Data {
	
	public static func append(_ data: Data, to target: inout Containee) {
		
		target.append(data)
		
	}
	
}
