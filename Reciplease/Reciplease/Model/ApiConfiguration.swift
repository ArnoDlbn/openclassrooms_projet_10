//
//  ApiConfiguration.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 05/06/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation

class ApiConfiguration {

    // get API Keys from ApiKeys.plist
    var apiNumber: ApiNumbers? {
        guard let path = Bundle.main.path(forResource: "ApiNumbers", ofType: "plist"), let data = FileManager.default.contents(atPath: path) else { return nil }
        guard let dataApi = try? PropertyListDecoder().decode(ApiNumbers.self, from: data) else { return nil }
        return dataApi
    }
}

// structure to manage API Keys
struct ApiNumbers: Decodable {
    let apiId: String
    let apiKey: String
}
