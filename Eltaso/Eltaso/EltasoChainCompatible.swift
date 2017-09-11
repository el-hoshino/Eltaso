//
//  EltasoChainCompatible.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/06/14.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import Foundation

public protocol EltasoChainableContainerType {
	
	associatedtype Containee: EltasoCompatible
	
	var body: Containee { get }
	
}

extension EltasoChainableContainerType {
	
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

extension EltasoContainer: EltasoChainableContainerType { }
extension Eltaso1AssociatedTypeContainer: EltasoChainableContainerType { }
extension Eltaso2AssociatedTypeContainer: EltasoChainableContainerType { }
