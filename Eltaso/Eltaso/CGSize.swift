//
//  CGSize.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension CGSize {
	
	public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
	}
	
	public static func += (lhs: inout CGSize, rhs: CGSize) {
		lhs = lhs + rhs
	}
	
	public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
	}
	
	public static func -= (lhs: inout CGSize, rhs: CGSize) {
		lhs = lhs - rhs
	}
	
	public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
	}
	
	public static func *= (lhs: inout CGSize, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	public static func * (lhs: CGSize, rhs: CGScale) -> CGSize {
		return CGSize(width: lhs.width * rhs.horizontal, height: lhs.height * rhs.vertical)
	}
	
	public static func *= (lhs: inout CGSize, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
	}
	
	public static func /= (lhs: inout CGSize, rhs: CGFloat) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGSize, rhs: CGScale) -> CGSize {
		return CGSize(width: lhs.width / rhs.horizontal, height: lhs.height / rhs.vertical)
	}
	
	public static func /= (lhs: inout CGSize, rhs: CGScale) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGSize, rhs: CGSize) -> CGScale {
		return CGScale(horizontal: lhs.width / rhs.width, vertical: lhs.height / rhs.height)
	}
	
}

extension CGSize: EltasoCompatible {
	
	public var eltaso: EltasoContainer<CGSize> {
		return EltasoContainer(body: self)
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public static func `init`(length: CGFloat) -> Containee {
		return Containee(length: length)
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public var maxLength: CGFloat {
		return self.body.maxLength
	}
	
	public var minLength: CGFloat {
		return self.body.minLength
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public static let identity = Containee.identity
	
}

extension EltasoContainer where Containee == CGSize {
	
	public enum Orientation {
		case landscape
		case portrait
		case square
	}
	
	public var orientation: Orientation {
		return self.body.orientation
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public var aspectRatio: CGFloat {
		return self.body.aspectRatio
	}
	
	public var isAspectRatioGreaterThan16by10: Bool {
		return self.body.isAspectRatioGreaterThan16by10
	}
	
	public var isAspectRatioLessThan10by16: Bool {
		return self.body.isAspectRatioLessThan10by16
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public var centerPoint: CGPoint {
		return self.body.centerPoint
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public func boundSizeAfterRotation(by angle: CGFloat) -> Containee {
		return self.body.boundSizeAfterRotation(by: angle)
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public func cropped(fromInsets insets: UIEdgeInsets) -> Containee {
		return self.body.cropped(fromInsets: insets)
	}
	
	public func cropped(fromMargin margin: CGFloat) -> Containee {
		return self.body.cropped(fromMargin: margin)
	}
	
	public func cropped(fromHorizontalMargin horizontalMargin: CGFloat, verticalMargin: CGFloat) -> Containee {
		return self.body.cropped(fromHorizontalMargin: horizontalMargin, verticalMargin: verticalMargin)
	}
	
}

// MARK: - Internal methods
extension CGSize {
	
	static func `init`(length: CGFloat) -> CGSize {
		return CGSize(width: length, height: length)
	}
	
}

extension CGSize {
	
	var maxLength: CGFloat {
		return max(self.width, self.height)
	}
	
	var minLength: CGFloat {
		return min(self.width, self.height)
	}
	
}

extension CGSize {
	
	static let identity = CGSize(width: 1, height: 1)
	
}

extension CGSize {
	
	var orientation: EltasoContainer<CGSize>.Orientation {
		switch self.width - self.height {
		case -.infinity ..< 0:
			return .portrait
			
		case 0:
			return .square
			
		case 0 ... .infinity:
			return .landscape
			
		case let x:
			assertionFailure("Logically impossible range found in number \(x)")
			return .square
		}
	}
	
}

extension CGSize {
	
	var aspectRatio: CGFloat {
		return self.width / self.height
	}
	
	var isAspectRatioGreaterThan16by10: Bool {
		return self.aspectRatio > 16 / 10
	}
	
	var isAspectRatioLessThan10by16: Bool {
		return self.aspectRatio < 10 / 16
	}
	
}

extension CGSize {
	
	var centerPoint: CGPoint {
		
		let x = self.width / 2
		let y = self.height / 2
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension CGSize {
	
	func boundSizeAfterRotation(by angle: CGFloat) -> CGSize {
		
		let rotatedBoundWidth = abs(self.width * cos(angle)) + abs(self.height * -sin(angle))
		let rotatedBoundHeight = abs(self.width * sin(angle)) + abs(self.height * cos(angle))
		let rotatedBoundSize = CGSize(width: rotatedBoundWidth, height: rotatedBoundHeight)
		
		return rotatedBoundSize
		
	}
	
}

extension CGSize {
	
	func cropped(fromInsets insets: UIEdgeInsets) -> CGSize {
		return CGSize(width: self.width - insets.left - insets.right,
		              height: self.height - insets.top - insets.bottom)
	}
	
	func cropped(fromMargin margin: CGFloat) -> CGSize {
		return CGSize(width: self.width - (margin * 2),
		              height: self.height - (margin * 2))
	}
	
	func cropped(fromHorizontalMargin horizontalMargin: CGFloat, verticalMargin: CGFloat) -> CGSize {
		return CGSize(width: self.width - (horizontalMargin * 2),
		              height: self.height - (verticalMargin * 2))
	}
	
}
