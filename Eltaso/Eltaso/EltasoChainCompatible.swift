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
	
	public func chained (_ process: (EltasoContainerChain<Containee>) throws -> EltasoContainerChain<Containee>) rethrows -> Containee {
		
		let chain = EltasoContainerChain(body: self.body)
		let result = try process(chain).commit()
		return result
		
	}
	
	public func chained <Result: EltasoCompatible> (_ process: (EltasoContainerChain<Containee>) throws -> EltasoContainerChain<Result>) rethrows -> Result {
		
		let chain = EltasoContainerChain(body: self.body)
		let result = try process(chain).commit()
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
extension Eltaso1AssociatedTypeContainer: EltasoChainableContainer { }
extension Eltaso2AssociatedTypeContainer: EltasoChainableContainer { }
