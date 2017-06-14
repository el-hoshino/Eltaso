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
	
}


public struct EltasoSingleAssociatedTypeContainer<Containee: EltasoCompatible, AssociatedType> {
	
	public let body: Containee
	
}



public struct EltasoDualAssociatedTypeContainer<Containee: EltasoCompatible, AssociatedType1, AssociatedType2> {
	
	public let body: Containee
	
}

extension EltasoCompatible {
	
	public var eltaso: EltasoContainer<Self> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoCompatible where Self: Sequence {
	
	public var eltaso: EltasoSingleAssociatedTypeContainer<Self, Self.Element> {
		return EltasoSingleAssociatedTypeContainer(body: self)
	}
	
}

extension EltasoCompatible where Self: RangeExpression {
	
	public var eltaso: EltasoSingleAssociatedTypeContainer<Self, Self.Bound> {
		return EltasoSingleAssociatedTypeContainer(body: self)
	}
	
}
