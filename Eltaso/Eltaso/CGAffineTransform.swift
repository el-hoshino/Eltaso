
//
//  CGAffineTransform.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGAffineTransform: EltasoCompatible { }

extension EltasoContainer where Containee == CGAffineTransform {
	
	public var possibleTranslation: CGVector {
		return CGVector(dx: self.body.tx, dy: self.body.ty)
	}
	
	public var possibleScale: CGScale {
		return CGScale(horizontal: sqrt(self.body.a * self.body.a + self.body.c * self.body.c),
		               vertical: sqrt(self.body.b * self.body.b + self.body.d * self.body.d))
	}
	
	public var possibleRotation: CGFloat {
		return atan2(self.body.b, self.body.a)
	}
	
}
