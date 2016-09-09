//
//  CGRect.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

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
