//
//  PropertyListConvertible.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public protocol PropertyListConvertible {
	init(fromPropertyList propertyList: [String: Any])
	func exportToPropertyList() -> [String: Any]
}
