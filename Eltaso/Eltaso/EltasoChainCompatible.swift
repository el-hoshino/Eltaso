//
//  EltasoChainCompatible.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/06/14.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import Foundation

public protocol EltasoChainableContainer {
	
	associatedtype Containee: EltasoCompatible
	var body: Containee { get }
	
}

extension EltasoChainableContainer {
	
	public func chained <Result: EltasoCompatible> (_ process: (EltasoContainerChain<Containee>) throws -> Result) rethrows -> Result {
		
		let chain = EltasoContainerChain(body: self.body)
		let result = try process(chain)
		return result
		
	}
	
}

public struct EltasoContainerChain<Containee> {
	
	let body: Containee
	
}

extension EltasoContainerChain {
	
	public func commit() -> Containee {
		return self.body
	}
	
}

extension EltasoContainer: EltasoChainableContainer { }
extension EltasoSingleAssociatedTypeContainer: EltasoChainableContainer { }
extension EltasoDualAssociatedTypeContainer: EltasoChainableContainer { }
