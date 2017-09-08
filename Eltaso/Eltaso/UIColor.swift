//
//  UIColor.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/05.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

// MARK: - Public methods
extension UIColor: EltasoCompatible {
	
}

extension EltasoContainer where Containee == UIColor {
	
	public static func `init`(hexRGBAValue: UInt) -> Containee {
		return Containee(hexRGBAValue: hexRGBAValue)
	}
	
}

// MARK: - Internal methods
extension UIColor {
	
	static func `init`(hexRGBAValue: UInt) -> UIColor {
		
		let hexRed = (hexRGBAValue & 0xFF000000) >> 24
		let hexGreen = (hexRGBAValue & 0x00FF0000) >> 16
		let hexBlue = (hexRGBAValue & 0x0000FF00) >> 8
		let hexAlpha = (hexRGBAValue & 0x000000FF) >> 0
		
		let red = CGFloat(hexRed) / CGFloat(UInt8.max)
		let green = CGFloat(hexGreen) / CGFloat(UInt8.max)
		let blue = CGFloat(hexBlue) / CGFloat(UInt8.max)
		let alpha = CGFloat(hexAlpha) / CGFloat(UInt8.max)
		
		let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
		return color
		
	}
	
}
