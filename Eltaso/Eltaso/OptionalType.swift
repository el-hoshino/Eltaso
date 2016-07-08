//
//  OptionalType.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public protocol OptionalType {
	associatedtype T
	var optionalValue: T? { get }
}

extension Optional: OptionalType {
	public var optionalValue: Wrapped? { return self }
}
