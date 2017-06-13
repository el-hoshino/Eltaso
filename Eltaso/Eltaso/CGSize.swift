//
//  CGSize.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

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

extension CGSize: EltasoCompatible { }

extension EltasoContainer where Containee == CGSize {
	
	public static func `init`(length: CGFloat) -> Containee {
		return Containee(width: length, height: length)
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public var maxLength: CGFloat {
		return max(self.body.width, self.body.height)
	}
	
	public var minLength: CGFloat {
		return min(self.body.width, self.body.height)
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public static let identity = Containee(width: 1, height: 1)
	
}

extension EltasoContainer where Containee == CGSize {
	
	public enum Orientation {
		case landscape
		case portrait
		case square
	}
	
	public var orientation: Orientation {
		switch self.body.width - self.body.height {
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

extension EltasoContainer where Containee == CGSize {
	
	public var aspectRatio: CGFloat {
		return self.body.width / self.body.height
	}
	
	public var isAspectRatioGreaterThan16by10: Bool {
		return self.aspectRatio > 16 / 10
	}
	
	public var isAspectRatioLessThan10by16: Bool {
		return self.aspectRatio < 10 / 16
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public var centerPoint: CGPoint {
		
		let x = self.body.width / 2
		let y = self.body.height / 2
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public func boundSizeAfterRotation(by angle: CGFloat) -> Containee {
		
		let rotatedBoundWidth = abs(self.body.width * cos(angle)) + abs(self.body.height * -sin(angle))
		let rotatedBoundHeight = abs(self.body.width * sin(angle)) + abs(self.body.height * cos(angle))
		let rotatedBoundSize = Containee(width: rotatedBoundWidth, height: rotatedBoundHeight)
		
		return rotatedBoundSize
		
	}
	
}

extension EltasoContainer where Containee == CGSize {
	
	public func cropped(fromInsets insets: UIEdgeInsets) -> Containee {
		return Containee(width: self.body.width - insets.left - insets.right,
		              height: self.body.height - insets.top - insets.bottom)
	}
	
	public func cropped(fromMargin margin: CGFloat) -> Containee {
		return Containee(width: self.body.width - (margin * 2),
		              height: self.body.height - (margin * 2))
	}
	
	public func cropped(fromHorizontalMargin horizontalMargin: CGFloat, verticalMargin: CGFloat) -> Containee {
		return Containee(width: self.body.width - (horizontalMargin * 2),
		              height: self.body.height - (verticalMargin * 2))
	}
	
}
