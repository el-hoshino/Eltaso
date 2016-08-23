//
//  Downloader.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/22.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public class Downloader {
	
	public enum Error: ErrorType {
		case NSError(error: Foundation.NSError)
		case InvalidURL(url: NSURL)
		case InvalidFile
	}
	
	private init() {
		
	}
	
	public static let shared = Downloader()
	
	public func downloadData(from url: NSURL, completionHandler: ((data: NSData, response: NSURLResponse) -> Void)? = nil, errorHandler: ((error: Error) -> Void)? = nil) {
		
		let session = NSURLSession.sharedSession()
		let task = session.downloadTaskWithURL(url) { (localURL, response, error) in
			
			guard let localURL = localURL, response = response else {
				if let error = error {
					errorHandler?(error: Error.NSError(error: error))
				} else {
					errorHandler?(error: Error.InvalidURL(url: url))
				}
				return
			}
			
			guard let data = NSData(contentsOfURL: localURL) else {
				errorHandler?(error: Error.InvalidFile)
				return
			}
			
			completionHandler?(data: data, response: response)
			
		}
		
		task.resume()
		
	}
	
}
