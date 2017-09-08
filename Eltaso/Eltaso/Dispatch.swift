//
//  Dispatch.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

// MARK: - Public methods
extension DispatchQueue: EltasoCompatible {
	
}

extension EltasoContainer where Containee: DispatchQueue {
	
	public static func runMainQueueWork(forcedSync shouldUseSync: Bool = false, execute work: @escaping @convention(block) () -> Swift.Void) {
		return Containee.runMainQueueWork(forcedSync: shouldUseSync, execute: work)
	}
	
}

extension EltasoContainer where Containee: DispatchQueue {
	
	public var isAvailable: Bool {
		return self.body.isAvailable
	}
	
}

extension EltasoContainer where Containee: DispatchQueue {
	
	public func syncRepeat(while condition: @autoclosure () -> Bool, loop: () -> Void) {
		return self.body.syncRepeat(while: condition, loop: loop)
	}
	
	public func asyncRepeat(while condition: @autoclosure @escaping () -> Bool, loop: @escaping () -> Void) {
		return self.body.asyncRepeat(while: condition, loop: loop)
	}
	
}

// MARK: - Internal methods
extension DispatchQueue {
	
	static func runMainQueueWork(forcedSync shouldUseSync: Bool = false, execute work: @escaping @convention(block) () -> Swift.Void) {
		
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

extension DispatchQueue {
	
	var isAvailable: Bool {
		
		guard Thread.current != self else {
			return true
		}
		
		let semaphore = DispatchSemaphore(value: 0)
		
		self.async {
			semaphore.signal()
		}
		
		return semaphore.wait(timeout: .now() + .microseconds(1)) == .success
		
	}
	
}

extension DispatchQueue {
	
	func syncRepeat(while condition: @autoclosure () -> Bool, loop: () -> Void) {
		
		self.sync {
			while condition() == true {
				loop()
			}
		}
		
	}
	
	func asyncRepeat(while condition: @autoclosure @escaping () -> Bool, loop: @escaping () -> Void) {
		
		self.async {
			while condition() == true {
				loop()
			}
		}
		
	}
	
}
