//
//  FBNetworkParserSpec.swift
//  FBNetworkTests
//
//  Created by Felipe Correia Brito on 08/11/20.
//

import Quick
import Nimble
import FBModel

@testable import FBNetwork

class FBNetworkParserSpec: QuickSpec {
    
    var url: URL!
    var request: URLRequest!
    
    override func spec() {
        describe("FBNetwork parse scheme") {
            
            beforeEach {
                self.url = URL(string: "https://localhost:9000/")
                guard self.url != nil else { fail("Impossible to create url"); return }
                self.request = URLRequest(url: self.url!)
            }
            
            it("can encode parameter in url") {
                do {
                    try FBNetworkURLParameterEncoder.encode(urlRequest: &self.request, with: ["id": "12345", "text": "abcdefg"])
                    
                    expect(self.request.url?.absoluteString).to(contain("https://localhost:9000/?"))
                    expect(self.request.url?.absoluteString).to(contain("&"))
                    expect(self.request.url?.absoluteString).to(contain("id=12345"))
                    expect(self.request.url?.absoluteString).to(contain("text=abcdefg"))
                    
                    expect("application/x-www-form-urlencoded; charset=utf-8").to(equal(self.request.value(forHTTPHeaderField: "Content-Type")))
                    
                } catch {
                    fail("Impossible to encode url request")
                }
            }
            
            it("can encode json body") {
                do {
                    try FBNetworkJSONParameterEncoder.encode(urlRequest: &self.request, with: ["id": "12345", "text": "abcdefg"])
                    
                    expect(self.request.httpBody).toNot(beNil())
                    
                    let string = String(data: self.request.httpBody!, encoding: .utf8)
                    
                    expect( ParametersModel.from(string ?? "") ).to(equal(ParametersModel.init(id: "12345", text: "abcdefg")))
                    print(string ?? "")
                    
                    expect("application/json").to(equal( self.request.value(forHTTPHeaderField: "Content-Type") ))
                }
                catch {
                    fail("Impossible to encode body json for request")
                }
            }
            
            afterEach {
                self.url = nil
                self.request = nil
            }
        }
    }
}

fileprivate struct ParametersModel: FBModel {
    let id: String
    let text: String
}
