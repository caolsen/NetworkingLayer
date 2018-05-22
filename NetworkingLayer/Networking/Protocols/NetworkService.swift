//
//  NetworkService.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

typealias NetworkServiceCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkService: class {
    associatedtype EndpointType: Endpoint
    func request(_ route: EndpointType, completion: @escaping NetworkServiceCompletion)
    func cancel()
}
