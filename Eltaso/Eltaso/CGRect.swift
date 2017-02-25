//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public func * (lhs: CGRect, rhs: CGFloat) -> CGRect {
	return CGRect(x: lhs.origin.x * rhs, y: lhs.origin.y * rhs, width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *= (lhs: inout CGRect, rhs: CGFloat) {
	lhs = lhs * rhs
}

public func * (lhs: CGRect, rhs: CGScale) -> CGRect {
	return CGRect(x: lhs.origin.x * rhs.horizontal, y: lhs.origin.y * rhs.vertical, width: lhs.width * rhs.horizontal, height: lhs.height * rhs.vertical)
}

public func *= (lhs: inout CGRect, rhs: CGScale) {
	lhs = lhs * rhs
}

public func / (lhs: CGRect, rhs: CGFloat) -> CGRect {
	return CGRect(x: lhs.origin.x / rhs, y: lhs.origin.y / rhs, width: lhs.width / rhs, height: lhs.height / rhs)
}

public func /= (lhs: inout CGRect, rhs: CGFloat) {
	lhs = lhs / rhs
}

public func / (lhs: CGRect, rhs: CGScale) -> CGRect {
	return CGRect(x: lhs.origin.x / rhs.horizontal, y: lhs.origin.y / rhs.vertical, width: lhs.width / rhs.horizontal, height: lhs.height / rhs.vertical)
}

public func /= (lhs: inout CGRect, rhs: CGScale) {
	lhs = lhs / rhs
}


extension CGRect {
	
	public static let identity = CGRect(origin: .zero, size: .identity)
	
}

extension CGRect {
	
	public static func createAspectFillFrame(fromContentSize contentSize: CGSize, andCanvasSize canvasSize: CGSize) -> CGRect {
		
		let scale = max(canvasSize.width / contentSize.width, canvasSize.height / contentSize.height)
		let scaledContentSize = contentSize * scale
		let scaledContentX = (canvasSize.width - scaledContentSize.width) / 2
		let scaledContentY = (canvasSize.height - scaledContentSize.height) / 2
		let scaledContentOrigin = CGPoint(x: scaledContentX, y: scaledContentY)
		let scaledContentFrame = CGRect(origin: scaledContentOrigin, size: scaledContentSize)
		
		return scaledContentFrame
		
	}
	
}

extension CGRect {
	
	public var centerPoint: CGPoint {
		
		let x = (self.origin.x + self.size.width) / 2
		let y = (self.origin.y + self.size.height) / 2
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension CGRect {
	
	public var zeroPositionedFrame: CGRect {
		return CGRect(origin: .zero, size: self.size)
	}
	
}

extension CGRect {
	
	public var top: CGFloat {
		get {
			return self.origin.y
		}
		set {
			self.origin.y = newValue
		}
	}
	
	public var bottom: CGFloat {
		get {
			return self.origin.y + self.height
		}
		set {
			self.size.height = newValue - self.origin.y
		}
	}
	
	public var left: CGFloat {
		get {
			return self.origin.x
		}
		set {
			self.origin.x = newValue
		}
	}
	
	public var right: CGFloat {
		get {
			return self.origin.x + self.width
		}
		set {
			self.size.width = newValue - self.origin.x
		}
	}
	
}

extension CGRect {
	
	public var topLeft: CGPoint {
		return CGPoint(x: self.top, y: self.left)
	}
	
	public var topRight: CGPoint {
		return CGPoint(x: self.top, y: self.right)
	}
	
	public var bottomLeft: CGPoint {
		return CGPoint(x: self.bottom, y: self.left)
	}
	
	public var bottomRight: CGPoint {
		return CGPoint(x: self.bottom, y: self.right)
	}
	
}

extension CGRect {
	
	public var horizontalRange: ClosedRange<CGFloat> {
		return self.left ... self.right
	}
	
	public var verticalRange: ClosedRange<CGFloat> {
		return self.top ... self.bottom
	}
	
}

extension CGRect {
	
	public func isIncluded(in anotherRect: CGRect) -> Bool {
		return self.horizontalRange …= anotherRect.horizontalRange && self.verticalRange …= anotherRect.verticalRange
	}
	
	public func isPartiallyIncluded(in anotherRect: CGRect) -> Bool {
		return self.horizontalRange ^ anotherRect.horizontalRange != nil && self.verticalRange ^ anotherRect.verticalRange != nil
	}
	
}

extension CGRect {
	
	public func horizontalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: vector.dx)
	}
	
	public func horizontalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: point.x)
	}
	
	public func horizontalExtensionRange(movingBy dx: CGFloat) -> ClosedRange<CGFloat>? {
		
		switch dx {
		case let dx where dx < 0:
			return self.left + dx ... self.left
			
		case let dx where dx > 0:
			return self.right ... self.right + dx
			
		case _:
			return nil
		}
		
	}
	
	
	public func verticalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.verticalExtensionRange(movingBy: vector.dy)
	}
	
	public func verticalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.verticalExtensionRange(movingBy: point.y)
	}
	
	public func verticalExtensionRange(movingBy dy: CGFloat) -> ClosedRange<CGFloat>? {
		
		switch dy {
		case let dy where dy < 0:
			return self.top + dy ... self.top
			
		case let dy where dy > 0:
			return self.bottom ... self.bottom + dy
			
		case _:
			return nil
		}
		
	}
	
}
