//
//  AlamoFireSessionFake.swift
//  RecipleaseTests
//
//  Created by Arnaud Dalbin on 21/07/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import Alamofire
@testable import Reciplease

class AlamofireSessionFake: AlamoSession {
    
    // MARK: - Properties
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    // MARK: - Initilization

    init(data: Data?, response: HTTPURLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    // MARK: - Method
    
    func request(with url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        let httpResponse = response
        let requestData = data
        let result = Request.serializeResponseJSON(response: httpResponse, data: requestData, error: nil)
        let urlRequest = URLRequest(url: URL(string: "https://www.apple.com")!)
        completionHandler(DataResponse(request: urlRequest, response: httpResponse, data: data, result: result))
    }
}
