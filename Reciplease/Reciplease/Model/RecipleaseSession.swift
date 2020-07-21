//
//  RecipleaseSession.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 21/07/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import Alamofire

    // MARK: - Protocol AlamoSession and class RecipleaseSession

protocol AlamoSession {
    func request(with url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void)
}

final class RecipleaseSession: AlamoSession {
    func request(with url: URL, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(url).responseJSON { responseData in
            completionHandler(responseData)
        }
    }
}
