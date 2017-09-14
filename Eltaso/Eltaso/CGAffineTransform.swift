
//
//  CGAffineTransform.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/09.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CGAffineTransform: EltasoCompatible {
	
	public var eltaso: EltasoContainer<CGAffineTransform> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == CGAffineTransform {
	
	public var possibleTranslation: CGVector {
		return self.body.possibleTranslation
	}
	
	public var possibleScale: CGScale {
		return self.body.possibleScale
	}
	
	public var possibleRotation: CGFloat {
		return self.body.possibleRotation
	}
	
}

// MARK: - Internal methods
extension CGAffineTransform {
	
	var possibleTranslation: CGVector {
		return CGVector(dx: self.tx, dy: self.ty)
	}
	
	var possibleScale: CGScale {
		return CGScale(horizontal: sqrt(self.a * self.a + self.c * self.c),
		               vertical: sqrt(self.b * self.b + self.d * self.d))
	}
	
	var possibleRotation: CGFloat {
		return atan2(self.b, self.a)
	}
	
}
