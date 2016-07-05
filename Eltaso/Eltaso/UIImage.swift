//
//  UIImage.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public extension UIImage {
	
	convenience init?(named name: String, inBundle bundle: NSBundle?) {
		self.init(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
	}
	
}
