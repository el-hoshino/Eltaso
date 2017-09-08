//
//  CustomOperators.swift
//  Eltaso
//
//  Created by 史翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation
import Swift

infix operator =? : AssignmentPrecedence

infix operator …= : ComparisonPrecedence
infix operator !…= : ComparisonPrecedence

infix operator ± : RangeFormationPrecedence


