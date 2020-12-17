//
//  RecipleaseSession.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 21/07/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import Alamofire

    // MARK: - Protocol Networking and class RecipleaseSession

protocol Networking {
        
    func request(with url: URL, completionHandler: @escaping (Data?, Error?, HTTPURLResponse?) -> Void)
}

final class RecipleaseSession: Networking {
        
    func request(with url: URL, completionHandler: @escaping (Data?, Error?, HTTPURLResponse?) -> Void) {
        AF.request(url).responseData { (response: AFDataResponse<Data>) in
            completionHandler(response.data, response.error, response.response)
        }
    }
}
