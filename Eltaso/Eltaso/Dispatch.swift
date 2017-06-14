//
//  Dispatch.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension DispatchQueue: EltasoCompatible {
	public var eltaso: EltasoContainer<DispatchQueue> {
		return EltasoContainer(body: self)
	}
}

extension EltasoContainer where Containee == DispatchQueue {
	
	public static func runMainQueueWork(forcedSync shouldUseSync: Bool = false, execute work: @escaping @convention(block) () -> Swift.Void) {
		
		if Thread.isMainThread {
			work()
			
		} else {
			if shouldUseSync {
				DispatchQueue.main.sync(execute: work)
				
			} else {
				DispatchQueue.main.async(execute: work)
				
			}
			
		}
		
	}
	
}

extension EltasoContainer where Containee == DispatchQueue {
	
	public var isAvailable: Bool {
		
		guard Thread.current != self.body else {
			return true
		}
		
		let semaphore = DispatchSemaphore(value: 0)
		
		self.body.async {
			semaphore.signal()
		}
		
		return semaphore.wait(timeout: .now() + .microseconds(1)) == .success
		
	}
	
}

extension EltasoContainer where Containee == DispatchQueue {
	
	public func syncRepeat(while condition: @autoclosure () -> Bool, loop: () -> Void) {
		
		self.body.sync {
			while condition() == true {
				loop()
			}
		}
		
	}
	
	public func asyncRepeat(while condition: @autoclosure @escaping () -> Bool, loop: @escaping () -> Void) {
		
		self.body.async {
			while condition() == true {
				loop()
			}
		}
		
	}
	
}
