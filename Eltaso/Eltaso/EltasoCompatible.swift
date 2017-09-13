//
//  EltasoCompatible.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/06/12.
//  Copyright © 2017年 Crazism. All rights reserved.
//

public protocol EltasoCompatible {
	
	associatedtype Eltaso
	
	var eltaso: Eltaso { get }
	
}

public struct EltasoContainer<Containee: EltasoCompatible> {
	
	public let body: Containee
	
	init(body: Containee) {
		self.body = body
	}
	
	public init(_ body: Containee) {
		self.body = body
	}
	
}

public struct Eltaso1AssociatedTypeContainer<Containee: EltasoCompatible, AssociatedType> {
	
	public let body: Containee
	
	init(body: Containee) {
		self.body = body
	}
	
	public init(_ body: Containee) {
		self.body = body
	}
	
}

public struct Eltaso2AssociatedTypeContainer<Containee: EltasoCompatible, AssociatedType1, AssociatedType2> {
	
	public let body: Containee
	
	init(body: Containee) {
		self.body = body
	}
	
	public init(_ body: Containee) {
		self.body = body
	}
	
}
