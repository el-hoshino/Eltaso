//
//  Downloader.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/08/22.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

open class Downloader {
	
	public enum Result {
		
		public enum Error: ErrorProtocol {
			case nsError(error: Foundation.NSError)
			case invalidURL(url: URL)
			case invalidFile
		}
		
		case success(data: Data, response: URLResponse)
		case failure(error: Error)
		
	}
	
	fileprivate init() {
		
	}
	
	open static let shared = Downloader()
	
	open func downloadData(from url: URL, completionHandler: (result: Result) -> Void) {
		
		let session = URLSession.shared
		let task = session.downloadTask(with: url, completionHandler: { (localURL, response, error) in
			
			guard let localURL = localURL, response = response else {
				if let error = error {
					completionHandler(result: .failure(error: .nsError(error: error)))
				} else {
					completionHandler(result: .failure(error: .invalidURL(url: url)))
				}
				return
			}
			
			guard let data = try? Data(contentsOf: localURL) else {
				completionHandler(result: .failure(error: .invalidFile))
				return
			}
			
			completionHandler(result: .success(data: data, response: response))
			
		}) 
		
		task.resume()
		
	}
	
}
