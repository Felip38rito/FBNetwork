//
//  JSONParameter.swift
//  FBNetwork
//
//  Created by Felipe Correia Brito on 08/11/20.
//

/// Parameter encoder for JSON sent at the body of http request
public struct FBNetworkJSONParameterEncoder: FBNetworkParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: FBNetworkParameters) throws {
        do {
            let json = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = json
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw FBNetworkError.encoding
        }
    }
}

