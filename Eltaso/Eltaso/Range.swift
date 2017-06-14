//
//  Range.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension Range: EltasoCompatible { }

extension EltasoSingleAssociatedTypeContainer where Containee == Range<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.lowerBound.distance(to: self.body.upperBound)
	}
	
	public func offset(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.lowerBound.increased(by: n) ..< self.body.upperBound.increased(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.lowerBound ..< self.body.upperBound.increased(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> Range<AssociatedType> {
		return self.body.lowerBound.decreased(by: n) ..< self.body.upperBound
	}
	
}
