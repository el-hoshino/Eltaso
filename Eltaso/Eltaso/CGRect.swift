//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CGRect {
	
	public static func * (lhs: CGRect, rhs: CGFloat) -> CGRect {
		return CGRect(x: lhs.origin.x * rhs, y: lhs.origin.y * rhs, width: lhs.width * rhs, height: lhs.height * rhs)
	}
	
	public static func *= (lhs: inout CGRect, rhs: CGFloat) {
		lhs = lhs * rhs
	}
	
	public static func * (lhs: CGRect, rhs: CGScale) -> CGRect {
		return CGRect(x: lhs.origin.x * rhs.horizontal, y: lhs.origin.y * rhs.vertical, width: lhs.width * rhs.horizontal, height: lhs.height * rhs.vertical)
	}
	
	public static func *= (lhs: inout CGRect, rhs: CGScale) {
		lhs = lhs * rhs
	}
	
	public static func / (lhs: CGRect, rhs: CGFloat) -> CGRect {
		return CGRect(x: lhs.origin.x / rhs, y: lhs.origin.y / rhs, width: lhs.width / rhs, height: lhs.height / rhs)
	}
	
	public static func /= (lhs: inout CGRect, rhs: CGFloat) {
		lhs = lhs / rhs
	}
	
	public static func / (lhs: CGRect, rhs: CGScale) -> CGRect {
		return CGRect(x: lhs.origin.x / rhs.horizontal, y: lhs.origin.y / rhs.vertical, width: lhs.width / rhs.horizontal, height: lhs.height / rhs.vertical)
	}
	
	public static func /= (lhs: inout CGRect, rhs: CGScale) {
		lhs = lhs / rhs
	}
	
}

extension CGRect: EltasoCompatible {
	public var eltaso: EltasoContainer<CGRect> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == CGRect {
	
	public static let identity = Containee(x: 0, y: 0, width: 1, height: 1)
	
}

extension EltasoContainer where Containee == CGRect {
	
	public static func createAspectFillFrame(fromContentSize contentSize: CGSize, andCanvasSize canvasSize: CGSize) -> Containee {
		
		let scale = max(canvasSize.width / contentSize.width, canvasSize.height / contentSize.height)
		let scaledContentSize = contentSize * scale
		let scaledContentX = (canvasSize.width - scaledContentSize.width) / 2
		let scaledContentY = (canvasSize.height - scaledContentSize.height) / 2
		let scaledContentOrigin = CGPoint(x: scaledContentX, y: scaledContentY)
		let scaledContentFrame = Containee(origin: scaledContentOrigin, size: scaledContentSize)
		
		return scaledContentFrame
		
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public var centerPoint: CGPoint {
		
		let x = (self.body.origin.x + self.body.size.width) / 2
		let y = (self.body.origin.y + self.body.size.height) / 2
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public var zeroPositionedFrame: Containee {
		return Containee(origin: .zero, size: self.body.size)
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

extension EltasoContainer where Containee == CGRect {
	
	public var top: CGFloat {
		return self.body.top
	}
	
	public var bottom: CGFloat {
		return self.body.bottom
	}
	
	public var left: CGFloat {
		return self.body.left
	}
	
	public var right: CGFloat {
		return self.body.right
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
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

extension EltasoContainer where Containee == CGRect {
	
	public var horizontalRange: ClosedRange<CGFloat> {
		return self.left ... self.right
	}
	
	public var verticalRange: ClosedRange<CGFloat> {
		return self.top ... self.bottom
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public func isIncluded(in anotherRect: Containee) -> Bool {
		return self.horizontalRange …= anotherRect.eltaso.horizontalRange
			&& self.verticalRange …= anotherRect.eltaso.verticalRange
	}
	
	public func isPartiallyIncluded(in anotherRect: Containee) -> Bool {
		return self.horizontalRange ^ anotherRect.eltaso.horizontalRange != nil
			&& self.verticalRange ^ anotherRect.eltaso.verticalRange != nil
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public func horizontalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: vector.dx)
	}
	
	public func horizontalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: point.x)
	}
	
	public func horizontalExtensionRange(movingBy dx: CGFloat) -> ClosedRange<CGFloat>? {
		
		switch dx {
		case -.infinity ..< 0:
			return self.left + dx ... self.left
			
		case 0:
			return nil
			
		case 0 ... .infinity:
			return self.right ... self.right + dx
			
		case let dx:
			assertionFailure("Logically impossible range found in number \(dx)")
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
		case -.infinity ..< 0:
			return self.top + dy ... self.top
			
		case 0:
			return nil
			
		case 0 ... .infinity:
			return self.bottom ... self.bottom + dy
			
		case let dy:
			assertionFailure("Logically impossible range found in number \(dy)")
			return nil
		}
		
	}
	
}
