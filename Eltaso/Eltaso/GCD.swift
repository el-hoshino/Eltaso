//
//  GCD.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/07/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public struct GCD {
	
	public enum Thread {
		
		case main
		case global(priority: QueuePriority)
		case `static`(queue: DispatchQueue)
		case dynamic(name: String, attribute: QueueAttribute)
		
		public var queue: DispatchQueue {
			switch self {
			case .main:
				return DispatchQueue.main
				
			case .global(priority: let priority):
				return DispatchQueue.global(priority: priority.value)
				
			case .static(queue: let queue):
				return queue
				
			case .dynamic(name: let name, attribute: let attribute):
				return DispatchQueue(label: name, attributes: attribute.value)
			}
		}
		
		public enum QueuePriority {
			case high
			case `default`
			case low
			case background
			
			var value: dispatch_queue_priority_t {
				switch self {
				case .high:
					return DispatchQueue.GlobalQueuePriority.high
					
				case .default:
					return DispatchQueue.GlobalQueuePriority.default
					
				case .low:
					return DispatchQueue.GlobalQueuePriority.low
					
				case .background:
					return DispatchQueue.GlobalQueuePriority.background
				}
				
			}
		}
		
		public enum QueueAttribute {
			case serial
			case concurrent
			
			var value: DispatchQueue.Attributes {
				switch self {
				case .serial:
					return DispatchQueue.Attributes()
					
				case .concurrent:
					return DispatchQueue.Attributes.concurrent
				}
			}
		}
		
	}
	
	public enum DispatchTime {
		case forever
		case timeAfter(delta: TimeInterval)
		
		public var dispatchTimeType: Dispatch.DispatchTime {
			switch self {
			case .forever:
				return DispatchTime.distantFuture
				
			case .timeAfter(delta: let delta):
				let nanoseconds = Int64(delta * TimeInterval(NSEC_PER_SEC))
				let time = DispatchTime.now() + Double(nanoseconds) / Double(NSEC_PER_SEC)
				return time
			}
		}
	}
	
	fileprivate init() {
		
	}
	
}

extension GCD { // MARK: Semaphores
	
	public static func createSemaphore(_ value: Int = 0) -> DispatchSemaphore {
		return DispatchSemaphore(value: value)
	}
	
	public static func fireSemaphore(_ semaphore: DispatchSemaphore) {
		semaphore.signal()
	}
	
	public static func waitForSemaphore(_ semaphore: DispatchSemaphore, until deadLine: DispatchTime = .forever) {
		semaphore.wait(timeout: deadLine.dispatchTimeType)
	}
	
}

extension GCD { // MARK: Groups
	
	public static func createGroup() -> DispatchGroup {
		return DispatchGroup()
	}
	
	public static func waitForGroup(_ group: DispatchGroup, until deadLine: DispatchTime = .forever) {
		group.wait(timeout: deadLine.dispatchTimeType)
	}
	
}

extension GCD { // MARK: Queues
	
	public static func runSynchronizedQueue(at thread: Thread = .main, with action: (() -> Void)) {
		
		thread.queue.sync {
			action()
		}
		
	}
	
	public static func runAsynchronizedQueue(in group: DispatchGroup? = nil, at thread: Thread = .main, waitUntilStartForMax waitTime: TimeInterval? = nil, with action: (() -> Void)) {
		
		switch (group, waitTime) {
		case (.some(let group), .some(let waitTime)):
			let semaphore = GCD.createSemaphore(thread.queue.hash)
			thread.queue.async(group: group, execute: { 
				GCD.fireSemaphore(semaphore)
				action()
			})
			GCD.waitForSemaphore(semaphore, until: waitTime == 0 || waitTime == .infinity ? .forever : .timeAfter(delta: waitTime))
			
		case (.some(let group), .none):
			thread.queue.async(group: group, execute: { 
				action()
			})
			
		case (.none, .some(let waitTime)):
			let semaphore = GCD.createSemaphore(thread.queue.hash)
			thread.queue.async(execute: {
				GCD.fireSemaphore(semaphore)
				action()
			})
			GCD.waitForSemaphore(semaphore, until: waitTime == 0 || waitTime == .infinity ? .forever : .timeAfter(delta: waitTime))
			
		case (.none, .none):
			thread.queue.async {
				action()
			}
			
		}
		
	}
	
}

extension GCD { // MARK: Main Thread Actions
	
	public static func runMainThreadAction(_ action: (() -> Void), forcedSync shouldForcedSync: Bool = false) {
		
		if Foundation.Thread.isMainThread {
			action()
		} else {
			if shouldForcedSync {
				GCD.runSynchronizedQueue(with: action)
			} else {
				GCD.runAsynchronizedQueue(with: action)
			}
		}
		
	}
	
}

extension GCD { // MARK: Check queue running status
	
	public static func isQueueRunning(_ queue: DispatchQueue) -> Bool {
		
		var isRunning = true
		
		let semaphore = GCD.createSemaphore(queue.hash)
		queue.async { 
			isRunning = false
			GCD.fireSemaphore(semaphore)
		}
		
		GCD.waitForSemaphore(semaphore, until: .timeAfter(delta: 0.001))
		
		return isRunning
		
	}
	
}

extension GCD { // MARK: Once
	
	public static func runOnceAction(_ action: (() -> Void), withToken token: inout Int) {
		
		dispatch_once(&token) { 
			action()
		}
		
	}
	
}
