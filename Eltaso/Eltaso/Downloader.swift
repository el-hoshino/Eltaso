//
//  Downloader.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/22.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class Downloader {
	
	public enum Result {
		
		public enum Error: ErrorType {
			case NSError(error: Foundation.NSError)
			case InvalidURL(url: NSURL)
			case InvalidFile
		}
		
		case Success(data: NSData, response: NSURLResponse)
		case Failure(error: Error)
		
	}
	
	private init() {
		
	}
	
	public static let shared = Downloader()
	
	public func downloadData(from url: NSURL, completionHandler: (result: Result) -> Void) {
		
		let session = NSURLSession.sharedSession()
		let task = session.downloadTaskWithURL(url) { (localURL, response, error) in
			
			guard let localURL = localURL, response = response else {
				if let error = error {
					completionHandler(result: .Failure(error: .NSError(error: error)))
				} else {
					completionHandler(result: .Failure(error: .InvalidURL(url: url)))
				}
				return
			}
			
			guard let data = NSData(contentsOfURL: localURL) else {
				completionHandler(result: .Failure(error: .InvalidFile))
				return
			}
			
			completionHandler(result: .Success(data: data, response: response))
			
		}
		
		task.resume()
		
	}
	
}
