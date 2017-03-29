//
//  RotatableView.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/11/01.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import UIKit

public protocol RotatableView: class {
	func rotate(by angle: CGFloat, from rotatingCenter: CGPoint?)
}

extension RotatableView where Self: UIView {
	
	public func rotate(by angle: CGFloat, from rotatingCenter: CGPoint?) {
		
		self.transform.rotate(by: angle)
		
		if let rotatingCenter = rotatingCenter {
			do {
				let midPointFromRotatingCenter = self.midPoint - rotatingCenter
				let midPointMatrix = try Matrix([[midPointFromRotatingCenter.x], [midPointFromRotatingCenter.y]])
				let rotatingMatrix = try Matrix([[cos(angle), -sin(angle)],
				                                 [sin(angle), cos(angle)]])
				let rotatedMidPointMatrix = try rotatingMatrix * midPointMatrix
				let rotatedMidPoint = CGPoint(x: rotatedMidPointMatrix[0, 0], y: rotatedMidPointMatrix[0, 1])
				let offset = rotatedMidPoint - midPointFromRotatingCenter
				self.transform.translateBy(x: offset.x, y: offset.y)
				
			} catch let error {
				Console.shared.warning(error)
				return
			}
			
		}
		
	}
	
}
