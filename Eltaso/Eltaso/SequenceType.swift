//
//  SequenceType.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension SequenceType where Generator.Element: OptionalType {
	
	var flatten: [Generator.Element.T] {
		return self.flatMap { $0.optionalValue }
	}
	
}
