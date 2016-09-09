//
//  Double.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/19.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Double {
	
	public var radianValue: Double {
		
		if #available(iOS 10.0, *) {
			let degreeMeasurement = Measurement(value: self, unit: UnitAngle.degrees)
			let radianMeasurement = degreeMeasurement.converted(to: .radians)
			return radianMeasurement.value
			
		} else {
			return self / 180 * .pi
			
		}
		
	}
	
}
