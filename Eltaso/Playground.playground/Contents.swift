//: Playground - noun: a place where people can play

import UIKit
import Eltaso

let flag = true

let i = flag.eltaso.chained { $0
	.negated
	.numbered
}

i
