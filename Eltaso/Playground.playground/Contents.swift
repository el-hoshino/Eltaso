//: Playground - noun: a place where people can play

import UIKit
import Eltaso

var str = "Hello, playground"

String.Eltaso.keepFirst(5, in: &str)

let a = [1, 2, 3]
a.eltaso.randomElement

let b = true
b.eltaso.chained { $0
	.negated
	.numbered
	.commit()
}

let c = EltasoContainerChain<Bool>.makeRandom().negated.commit
