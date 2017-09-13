//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
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
	
	public static let identity = Containee.identity
	
}

extension EltasoContainer where Containee == CGRect {
	
	public static func makeAspectFillFrame(fromContentSize contentSize: CGSize, andCanvasSize canvasSize: CGSize) -> Containee {
		return Containee.makeAspectFillFrame(fromContentSize: contentSize, andCanvasSize: canvasSize)
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public var midPoint: CGPoint {
		return self.body.midPoint
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public var zeroPositionedFrame: Containee {
		return self.body.zeroPositionedFrame
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
		return self.body.topLeft
	}
	
	public var topRight: CGPoint {
		return self.body.topRight
	}
	
	public var bottomLeft: CGPoint {
		return self.body.bottomLeft
	}
	
	public var bottomRight: CGPoint {
		return self.body.bottomRight
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public var horizontalRange: ClosedRange<CGFloat> {
		return self.body.horizontalRange
	}
	
	public var verticalRange: ClosedRange<CGFloat> {
		return self.body.verticalRange
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public func isIncluded(in anotherRect: Containee) -> Bool {
		return self.body.isIncluded(in: anotherRect)
	}
	
	public func isPartiallyIncluded(in anotherRect: Containee) -> Bool {
		return self.body.isPartiallyIncluded(in: anotherRect)
	}
	
}

extension EltasoContainer where Containee == CGRect {
	
	public func horizontalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.body.horizontalExtensionRange(movingBy: vector)
	}
	
	public func horizontalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.body.horizontalExtensionRange(movingBy: point)
	}
	
	public func horizontalExtensionRange(movingBy dx: CGFloat) -> ClosedRange<CGFloat>? {
		return self.body.horizontalExtensionRange(movingBy: dx)
	}
	
	
	public func verticalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.body.verticalExtensionRange(movingBy: vector)
	}
	
	public func verticalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.body.verticalExtensionRange(movingBy: point)
	}
	
	public func verticalExtensionRange(movingBy dy: CGFloat) -> ClosedRange<CGFloat>? {
		return self.body.verticalExtensionRange(movingBy: dy)
	}
	
}

// MARK: - Internal methods
extension CGRect {
	
	static let identity = CGRect(x: 0, y: 0, width: 1, height: 1)
	
}

extension CGRect {
	
	static func makeAspectFillFrame(fromContentSize contentSize: CGSize, andCanvasSize canvasSize: CGSize) -> CGRect {
		
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
	
	var midPoint: CGPoint {
		
		let x = self.midX
		let y = self.midY
		
		return CGPoint(x: x, y: y)
		
	}
	
}

extension CGRect {
	
	var zeroPositionedFrame: CGRect {
		return CGRect(origin: .zero, size: self.size)
	}
	
}

extension CGRect {
	
	var top: CGFloat {
		get {
			return self.origin.y
		}
		set {
			self.origin.y = newValue
		}
	}
	
	var bottom: CGFloat {
		get {
			return self.origin.y + self.height
		}
		set {
			self.size.height = newValue - self.origin.y
		}
	}
	
	var left: CGFloat {
		get {
			return self.origin.x
		}
		set {
			self.origin.x = newValue
		}
	}
	
	var right: CGFloat {
		get {
			return self.origin.x + self.width
		}
		set {
			self.size.width = newValue - self.origin.x
		}
	}
	
}

extension CGRect {
	
	var topLeft: CGPoint {
		return CGPoint(x: self.top, y: self.left)
	}
	
	var topRight: CGPoint {
		return CGPoint(x: self.top, y: self.right)
	}
	
	var bottomLeft: CGPoint {
		return CGPoint(x: self.bottom, y: self.left)
	}
	
	var bottomRight: CGPoint {
		return CGPoint(x: self.bottom, y: self.right)
	}
	
}

extension CGRect {
	
	var horizontalRange: ClosedRange<CGFloat> {
		return self.left ... self.right
	}
	
	var verticalRange: ClosedRange<CGFloat> {
		return self.top ... self.bottom
	}
	
}

extension CGRect {
	
	func isIncluded(in anotherRect: CGRect) -> Bool {
		return self.horizontalRange …= anotherRect.eltaso.horizontalRange
			&& self.verticalRange …= anotherRect.eltaso.verticalRange
	}
	
	func isPartiallyIncluded(in anotherRect: CGRect) -> Bool {
		return self.horizontalRange * anotherRect.horizontalRange != nil
			&& self.verticalRange * anotherRect.verticalRange != nil
	}
	
}

extension CGRect {
	
	func horizontalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: vector.dx)
	}
	
	func horizontalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.horizontalExtensionRange(movingBy: point.x)
	}
	
	func horizontalExtensionRange(movingBy dx: CGFloat) -> ClosedRange<CGFloat>? {
		
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
	
	
	func verticalExtensionRange(movingBy vector: CGVector) -> ClosedRange<CGFloat>? {
		return self.verticalExtensionRange(movingBy: vector.dy)
	}
	
	func verticalExtensionRange(movingBy point: CGPoint) -> ClosedRange<CGFloat>? {
		return self.verticalExtensionRange(movingBy: point.y)
	}
	
	func verticalExtensionRange(movingBy dy: CGFloat) -> ClosedRange<CGFloat>? {
		
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
