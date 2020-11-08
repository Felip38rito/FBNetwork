//
//  Parameter.swift
//  FBNetwork
//
//  Created by Felipe Correia Brito on 08/11/20.
//

/// Parameter encoder for parameters sent at url
public struct FBNetworkURLParameterEncoder: FBNetworkParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: FBNetworkParameters) throws {
        guard let url = urlRequest.url else { throw FBNetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = parameters.map({ (key, value) -> URLQueryItem in
                return URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            })
            
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
