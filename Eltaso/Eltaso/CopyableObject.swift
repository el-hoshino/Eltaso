//
//  CopyableObject.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/08.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public protocol CopyableObject: class {
	var copied: Self { get }
}

extension CopyableObject where Self: NSObject {
	
	public var copied: Self {
		
		guard let copied = self.copy() as? Self else {
			fatalError("Fundamental error that unable to copy self as Self")
		}
		
		return copied
		
	}
	
}
