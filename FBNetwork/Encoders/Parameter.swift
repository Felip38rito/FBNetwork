//
//  Parameter.swift
//  FBNetwork
//
//  Created by Felipe Correia Brito on 08/11/20.
//

/// FBNetwork parameters
public typealias FBNetworkParameters = [String: Any]

/// Parameter encoder for the FBNetwork
public protocol FBNetworkParameterEncoder {
    /// Encode the parameters inside the url request
    /// - Parameters:
    ///   - urlRequest: request to be performed
    ///   - parameters: parameters to be informed
    static func encode(urlRequest: inout URLRequest, with parameters: FBNetworkParameters) throws
}
