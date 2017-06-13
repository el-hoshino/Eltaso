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

extension EltasoCompatible {
	
	public var eltaso: EltasoContainer<Self> {
		return EltasoContainer(body: self)
	}
	
}

public struct EltasoContainer<Containee: EltasoCompatible> {
	
	public let body: Containee
	
}
