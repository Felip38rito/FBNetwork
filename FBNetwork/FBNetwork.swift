//
//  FBNetwork.swift
//  FBNetwork
//
//  Created by Felipe Correia Brito on 07/11/20.
//

import Foundation
import FBModel

/// FBNetwork HTTP Headers
public typealias FBNetworkHeaders = [String: String]

/// Network layer for calling http(s) requests
public class FBNetwork<Endpoint: FBNetworkEndpoint, R: FBModel, F: FBModel> {
    
    /// Response handler possibilities for any call
    public enum FBNetworkResponse {
        /// Success handler for api:
        /// - Parameters:
        /// - Parameter R: The model to encode the response
        /// - Parameter URLResponse: The response gathered from the internet in case you'll need to address it directly
        /// - Parameter Data: The full response buffer in Data format
        case success(R, URLResponse, Data?)
        /// Success handler for api:
        /// - Parameters:
        /// - Parameter F: The model to encode the response in case of error
        /// - Parameter URLResponse: The response gathered from the internet in case you'll need to address it directly
        /// - Parameter Error: The error object describing the error obtained by either api or parse/encode
        case failure(F, URLResponse, Data?, Error?) 
    }
    
    /// Typical callback for the network layer
    public typealias FBNetworkCallback = (_ response: FBNetworkResponse) -> ()
    
    /// Send a get request to an specific endpoint
    /// - Parameter where: The endpoint that will respond to this get request
    /// - Parameter callback: The callback that receive a Data? Object
    public func get(_ where: Endpoint, callback: @escaping FBNetworkCallback) {
        
    }
    
    /// Send a post request to an specific endpoint
    /// - Parameters:
    /// - Parameter where: The endpoint that will respond to this post request
    /// - Parameter callback: The callback that receive a Data? Object
    public func post(_ where: Endpoint, callback: @escaping FBNetworkCallback) {
        
    }
    
    /// Send a patch request to an specific endpoint
    /// - Parameters:
    /// - Parameter where: The endpoint that will respond to this post request
    /// - Parameter callback: The callback that receive a Data? Object
    public func patch(_ where: Endpoint, callback: @escaping FBNetworkCallback) {
        
    }
    
    /// Send a put request to an specific endpoint
    /// - Parameters:
    /// - Parameter where: The endpoint that will respond to this post request
    /// - Parameter callback: The callback that receive a Data? Object
    public func put(_ where: Endpoint, callback: @escaping FBNetworkCallback) {
        
    }
    
    /// Send a delete request to an specific endpoint
    /// - Parameters:
    /// - Parameter where: The endpoint that will respond to this post request
    /// - Parameter callback: The callback that receive a Data? Object
    public func delete(_ where: Endpoint, callback: @escaping FBNetworkCallback) {
        
    }
    
    /// Send a request for an endpoint expecting to parse the response as JSON
    /// - Parameters:
    ///   - where: endpoint that will respond to the request
    ///   - method: HTTP method of the request
    ///   - callback: The callback that receive and treats the response
    private func request(_ where: Endpoint, method: FBHTTPMethod, callback: @escaping FBNetworkCallback) {
        
    }
}

/// An endpoint to be used within FBNetwork utility
public protocol FBNetworkEndpoint {
    /// The url for this endpoint
    var url: String { get }
}

/// The HTTP method that will be used within FBNetwork
public enum FBHTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case patch  = "PATCH"
    case delete = "DELETE"
}

public enum FBNetworkError: String, Error {
    case missingURL = "URL is nil"
    case parse = "Can't parse the response with model"
    case encoding = "Can't encode the request in JSON format"
}
