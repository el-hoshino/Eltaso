//
//  CGSize.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public extension CGSize {
	
	public init(length: CGFloat) {
		self.init(width: length, height: length)
	}
	
	var maxLength: CGFloat {
		return max(self.width, self.height)
	}
	
	var minLength: CGFloat {
		return min(self.width, self.height)
	}
	
	var aspectRatio: CGFloat {
		return self.width / self.height
	}
	
	public var isAspectRatioGreaterThan16by10: Bool {
		return self.aspectRatio > 16 / 10
	}
	
	public var isAspectRatioLessThan10by16: Bool {
		return self.aspectRatio < 10 / 16
	}
	
	public func createSize(fromInsets insets: UIEdgeInsets) -> CGSize {
		return CGSize(width: self.width + insets.left + insets.right, height: self.height + insets.top + insets.bottom)
	}
	
	public func createSize(fromMargin margin: CGFloat) -> CGSize {
		return CGSize(width: self.width + (margin * 2), height: self.height + (margin * 2))
	}
	
}
