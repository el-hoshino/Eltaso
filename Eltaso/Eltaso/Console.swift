//
//  Console.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public struct Console {
	
	private init(){}
	
	public static let shared = Console()
	
}

extension Console {
	
	public func info(_ items: Any?...) {
		#if DEBUG
			print(items)
		#endif
	}
	
	public func warning(_ items: Any?...) {
		#if DEBUG
			print("---!!!", terminator: "")
			print(items, terminator: "")
			print("!!!---")
		#endif
	}
	
}
