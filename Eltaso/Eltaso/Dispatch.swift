//
//  Dispatch.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension DispatchQueue {
	
	open class func runMainQueueWork(forcedSync shouldUseSync: Bool = false, execute work: @escaping @convention(block) () -> Swift.Void) {
		
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
	
	public var isRunning: Bool {
		
		guard Thread.current != self else {
			return false
		}
		
		let semaphore = DispatchSemaphore(value: 0)
		
		self.async {
			semaphore.signal()
		}
		
		return semaphore.wait(timeout: .now() + .microseconds(1)) == .success
		
	}
	
}
