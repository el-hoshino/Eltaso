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
		
		public enum Error: Swift.Error {
			case taskError(Swift.Error)
			case contentError(Swift.Error)
			case invalidURL(url: URL)
		}
		
		case success(data: Data, response: URLResponse)
		case failure(error: Error)
		
	}
	
	fileprivate init() {
		
	}
	
	public static let shared = Downloader()
	
	open func downloadData(from url: URL, completionHandler: @escaping (_ result: Result) -> Void) {
		
		let session = URLSession.shared
		let task = session.downloadTask(with: url, completionHandler: { (localURL, response, error) in
			
			guard let localURL = localURL, let response = response else {
				if let error = error {
					completionHandler(.failure(error: .taskError(error)))
				} else {
					completionHandler(.failure(error: .invalidURL(url: url)))
				}
				return
			}
			
			do {
				let data = try Data(contentsOf: localURL)
				completionHandler(.success(data: data, response: response))
				
			} catch let error {
				completionHandler(.failure(error: .contentError(error)))
				
			}
			
		})
		
		task.resume()
		
	}
	
}
