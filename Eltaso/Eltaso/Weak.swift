//
//  Weak.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/20.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class Weak <T: AnyObject> {
	open weak var value: T?
	public init(_ object: T?) {
		self.value = object
	}
}
