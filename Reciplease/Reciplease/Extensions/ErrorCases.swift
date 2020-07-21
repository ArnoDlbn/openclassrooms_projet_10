//
//  ErrorCases.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 21/07/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation

// enumeration to manage errors
enum ErrorCases: Swift.Error {
    case noData
    case wrongResponse(statusCode: Int?)
    case failure
    case errorDecode
}
