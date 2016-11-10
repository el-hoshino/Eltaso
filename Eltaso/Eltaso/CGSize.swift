//
//  CGSize.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func + (lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

public func += (lhs: inout CGSize, rhs: CGSize) {
	lhs = lhs + rhs
}

public func - (lhs: CGSize, rhs: CGSize) -> CGSize {
	return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

public func -= (lhs: inout CGSize, rhs: CGSize) {
	lhs = lhs - rhs
}

public func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *= (lhs: inout CGSize, rhs: CGFloat) {
	lhs = lhs * rhs
}

public func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
	return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
}

public func /= (lhs: inout CGSize, rhs: CGFloat) {
	lhs = lhs / rhs
}


extension CGSize {
	
	public init(length: CGFloat) {
		self.init(width: length, height: length)
	}
	
}

extension CGSize {
	
	public var maxLength: CGFloat {
		return max(self.width, self.height)
	}
	
	public var minLength: CGFloat {
		return min(self.width, self.height)
	}
	
}

extension CGSize {
	
	public enum Orientation {
		case landscape
		case portrait
		case square
	}
	
	public var orientation: Orientation {
		switch self.width - self.height {
		case let difference where difference > 0:
			return .landscape
			
		case let difference where difference < 0:
			return .portrait
			
		default:
			return .square
		}
	}
	
}

extension CGSize {
	
	public var aspectRatio: CGFloat {
		return self.width / self.height
	}
	
	public var isAspectRatioGreaterThan16by10: Bool {
		return self.aspectRatio > 16 / 10
	}
	
	public var isAspectRatioLessThan10by16: Bool {
		return self.aspectRatio < 10 / 16
	}
	
}

extension CGSize {
	
	public var centerPoint: CGPoint {
		
		let x = self.width / 2
		let y = self.height / 2
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension CGSize {
	
	public func rotated(by angle: CGFloat) -> CGSize {
		
		let rotatedWidth = abs(self.width * cos(angle)) + abs(self.height * -sin(angle))
		let rotatedHeight = abs(self.width * sin(angle)) + abs(self.height * cos(angle))
		let rotatedSize = CGSize(width: rotatedWidth, height: rotatedHeight)
		
		return rotatedSize
		
	}
	
	public mutating func rotate(by angle: CGFloat) {
		self = self.rotated(by: angle)
	}
	
}

extension CGSize {
	
	public func cropped(fromInsets insets: UIEdgeInsets) -> CGSize {
		return CGSize(width: self.width - insets.left - insets.right, height: self.height - insets.top - insets.bottom)
	}
	
	public func cropped(fromMargin margin: CGFloat) -> CGSize {
		return CGSize(width: self.width - (margin * 2), height: self.height - (margin * 2))
	}
	
	public func cropped(fromHorizontalMargin horizontalMargin: CGFloat, verticalMargin: CGFloat) -> CGSize {
		return CGSize(width: self.width - (horizontalMargin * 2), height: self.height - (verticalMargin * 2))
	}
	
}
