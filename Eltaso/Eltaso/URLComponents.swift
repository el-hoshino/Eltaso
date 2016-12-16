//
//  URLComponents.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/12/06.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

extension URLComponents {
	
	public init(queryItems: [URLQueryItem]) {
		self = URLComponents()
		self.queryItems = queryItems
	}
	
}
