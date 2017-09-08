//
//  Bool.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension Bool: EltasoCompatible {
	
}

extension EltasoContainer where Containee == Bool {
	
	public static func makeRandom() -> Containee {
		return Containee.makeRandom()
	}
	
}

extension EltasoContainer where Containee == Bool {
	
	public var negated: Containee {
		return self.body.negated
	}
	
	public static func nagate(_ target: inout Containee) {
		target.nagate()
	}
	
}

extension EltasoContainerChain where Containee == Bool {
	
	public static func makeRandom() -> EltasoContainerChain<Bool> {
		return .init(body: Containee.makeRandom())
	}
	
}

extension EltasoContainerChain where Containee == Bool {
	
	public var negated: EltasoContainerChain<Bool> {
		return .init(body: self.body.negated)
	}
	
	public var numbered: EltasoContainerChain<Int> {
		return .init(body: self.body.numbered)
	}
	
}

// MARK: - Internal methods
extension Bool {
	
	static func makeRandom() -> Bool {
		let randomNumber = Int.makeRandom(within: 0 ... 1)
		return randomNumber != 0
	}
	
}

extension Bool {
	
	var negated: Bool {
		return !self
	}
	
	mutating func nagate() {
		self = self.negated
	}
	
}

extension Bool {
	
	var numbered: Int {
		return self == true ? 1 : 0
	}
	
}
