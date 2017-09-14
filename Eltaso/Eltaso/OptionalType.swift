//
//  OptionalType.swift
//  Eltaso
//
//  Created by 史　翔新 on 2017/09/07.
//  Copyright © 2017年 Crazism. All rights reserved.
//

import Foundation

public protocol OptionalType {
	
	associatedtype WrappedType
	
	var optinal: WrappedType? { get }
	
}

extension Optional: OptionalType {
	
	public var optinal: Wrapped? {
		return self
	}
	
}
