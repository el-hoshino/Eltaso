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
		
		case Main
		case Global(priority: QueuePriority)
		case Static(queue: dispatch_queue_t)
		case Dynamic(name: String, attribute: QueueAttribute)
		
		public var queue: dispatch_queue_t {
			switch self {
			case .Main:
				return dispatch_get_main_queue()
				
			case .Global(priority: let priority):
				return dispatch_get_global_queue(priority.value, 0)
				
			case .Static(queue: let queue):
				return queue
				
			case .Dynamic(name: let name, attribute: let attribute):
				return dispatch_queue_create(name, attribute.value)
			}
		}
		
		public enum QueuePriority {
			case High
			case Default
			case Low
			case Background
			
			var value: dispatch_queue_priority_t {
				switch self {
				case .High:
					return DISPATCH_QUEUE_PRIORITY_HIGH
					
				case .Default:
					return DISPATCH_QUEUE_PRIORITY_DEFAULT
					
				case .Low:
					return DISPATCH_QUEUE_PRIORITY_LOW
					
				case .Background:
					return DISPATCH_QUEUE_PRIORITY_BACKGROUND
				}
				
			}
		}
		
		public enum QueueAttribute {
			case Serial
			case Concurrent
			
			var value: dispatch_queue_attr_t {
				switch self {
				case .Serial:
					return DISPATCH_QUEUE_SERIAL
					
				case .Concurrent:
					return DISPATCH_QUEUE_CONCURRENT
				}
			}
		}
		
	}
	
	private init() {
		
	}
	
}

extension GCD { // MARK: Semaphores
	
	public enum DispatchTime {
		case Forever
		case TimeAfter(delta: NSTimeInterval)
		
		public var dispatchTimeType: dispatch_time_t {
			switch self {
			case .Forever:
				return DISPATCH_TIME_FOREVER
				
			case .TimeAfter(delta: let delta):
				let nanoseconds = Int64(delta * NSTimeInterval(NSEC_PER_SEC))
				let time = dispatch_time(DISPATCH_TIME_NOW, nanoseconds)
				return time
			}
		}
	}
	
	public static func createSemaphore(value: Int) -> dispatch_semaphore_t {
		return dispatch_semaphore_create(value)
	}
	
	public static func fireSemaphore(semaphore: dispatch_semaphore_t) {
		dispatch_semaphore_signal(semaphore)
	}
	
	public static func waitForSemaphore(semaphore: dispatch_semaphore_t, until deadLine: DispatchTime = .Forever) {
		dispatch_semaphore_wait(semaphore, deadLine.dispatchTimeType)
	}
	
}

extension GCD { // MARK: Queues
	
	public static func runSynchronizedQueue(at thread: Thread = .Main, with action: (() -> Void)) {
		
		dispatch_sync(thread.queue) {
			action()
		}
		
	}
	
	public static func runAsynchronizedQueue(at thread: Thread = .Main, waitUntilStartForMax waitTime: NSTimeInterval? = nil, with action: (() -> Void)) {
		
		if let waitTime = waitTime {
			let semaphore = GCD.createSemaphore(thread.queue.hash)
			dispatch_async(thread.queue, {
				GCD.fireSemaphore(semaphore)
				action()
			})
			GCD.waitForSemaphore(semaphore, until: waitTime == 0 || waitTime == .infinity ? .Forever : .TimeAfter(delta: waitTime))
			
		} else {
			dispatch_async(thread.queue) {
				action()
			}
		}
		
	}
	
}

extension GCD { // MARK: Main Thread Actions
	
	public static func runMainThreadAction(action: (() -> Void)) {
		
		if NSThread.isMainThread() {
			action()
		} else {
			GCD.runAsynchronizedQueue(with: action)
		}
		
	}
	
}
