//
//  CGScale.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/10.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
public struct CGScale {
	
	public var horizontal: CGFloat
	
	public var vertical: CGFloat
	
	public init(horizontal: CGFloat, vertical: CGFloat) {
		self.horizontal = horizontal
		self.vertical = vertical
	}
	
}

extension CGScale {
	
	public static func * (lhs: CGScale, rhs: CGFloat) -> CGScale {
		return CGScale(horizontal: lhs.horizontal * rhs, vertical: lhs.vertical * rhs)
	}
	
	public static func *= (lhs: inout CGScale, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGScale, rhs: CGFloat) -> CGScale {
		return CGScale(horizontal: lhs.horizontal / rhs, vertical: lhs.vertical / rhs)
	}
	
	public static func /= (lhs: inout CGScale, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	
	public static func * (lhs: CGScale, rhs: CGScale) -> CGScale {
		return CGScale(horizontal: lhs.horizontal * rhs.horizontal, vertical: lhs.vertical * rhs.vertical)
	}
	
	public static func *= (lhs: inout CGScale, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGScale, rhs: CGScale) -> CGScale {
		return CGScale(horizontal: lhs.horizontal / rhs.horizontal, vertical: lhs.vertical / rhs.vertical)
	}
	
	public static func /= (lhs: inout CGScale, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
}

extension CGScale {
	
	public init() {
		self.horizontal = 0
		self.vertical = 0
	}
	
}

extension CGScale {

	public static let zero: CGScale = CGScale()
	
	public static let identity = CGScale(horizontal: 1, vertical: 1)
	
}

extension CGScale: EltasoCompatible {
	
	public var eltaso: EltasoContainer<CGScale> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == CGScale {
	
	public static func `init`(scale: CGFloat) -> Containee {
		return Containee(scale: scale)
	}
	
}

extension EltasoContainer where Containee == CGScale {
	
	public var aspectFitScale: CGFloat {
		return self.body.aspectFitScale
	}
	
	public var aspectFillScale: CGFloat {
		return self.body.aspectFillScale
	}
	
}

// MARK: - Internal methods
extension CGScale {
	
	static func `init`(scale: CGFloat) -> CGScale {
		return CGScale(horizontal: scale, vertical: scale)
	}
	
}

extension CGScale {
	
	var aspectFitScale: CGFloat {
		return min(self.horizontal, self.vertical)
	}
	
	var aspectFillScale: CGFloat {
		return max(self.horizontal, self.vertical)
	}
	
}
