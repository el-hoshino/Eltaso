//
//  Bool.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Bool: EltasoCompatible {
	public var eltaso: EltasoContainer<Bool> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == Bool {
	
	public static func makeRandom() -> Containee {
		let randomNumber = Int.Eltaso.makeRandom(within: 0 ... 1)
		return randomNumber != 0
	}
	
}

extension EltasoContainer where Containee == Bool {
	
	public var negated: Containee {
		return !self.body
	}
	
	public static func nagate(_ target: inout Containee) {
		target = target.eltaso.negated
	}
	
}

extension EltasoContainerChain where Containee == Bool {
	
	public static func makeRandom() -> EltasoContainerChain<Bool> {
		return EltasoContainerChain(body: Bool.Eltaso.makeRandom())
	}
	
}

extension EltasoContainerChain where Containee == Bool {
	
	public var negated: EltasoContainerChain<Bool> {
		return EltasoContainerChain(body: self.body.eltaso.negated)
	}
	
	public var numbered: EltasoContainerChain<Int> {
		let number = self.body == true ? 1 : 0
		return EltasoContainerChain<Int>(body: number)
	}
	
}
