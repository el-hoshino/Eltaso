//
//  CountableRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CountableRange: EltasoCompatible {
	public var eltaso: EltasoSingleAssociatedTypeContainer<CountableRange<Bound>, Bound> {
		return EltasoSingleAssociatedTypeContainer(body: self)
	}
}

extension EltasoSingleAssociatedTypeContainer where Containee == CountableRange<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.lowerBound.distance(to: self.body.upperBound)
	}
	
	public func offset(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: n) ..< self.body.upperBound.advanced(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.lowerBound ..< self.body.upperBound.advanced(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> CountableRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: -n) ..< self.body.upperBound
	}
	
}
