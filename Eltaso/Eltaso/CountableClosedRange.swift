//
//  CountableClosedRange.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/15.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension CountableClosedRange: EltasoCompatible {
	public var eltaso: EltasoSingleAssociatedTypeContainer<CountableClosedRange<Bound>, Bound> {
		return EltasoSingleAssociatedTypeContainer(body: self)
	}
}

extension EltasoSingleAssociatedTypeContainer where Containee == CountableClosedRange<AssociatedType>, AssociatedType: Strideable {
	
	public var width: AssociatedType.Stride {
		return self.body.lowerBound.distance(to: self.body.upperBound)
	}
	
	public func offset(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: n) ... self.body.upperBound.advanced(by: n)
	}
	
	public func appendingUpperBound(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound ... self.body.upperBound.advanced(by: n)
	}
	
	public func appendingLowerBound(by n: AssociatedType.Stride) -> CountableClosedRange<AssociatedType> {
		return self.body.lowerBound.advanced(by: -n) ... self.body.upperBound
	}
	
}
