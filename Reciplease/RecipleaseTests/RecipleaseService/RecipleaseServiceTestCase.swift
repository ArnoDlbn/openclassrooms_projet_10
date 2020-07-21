//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by Arnaud Dalbin on 22/04/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import XCTest
@testable import Reciplease

class RecipleaseServiceTestcase: XCTestCase {
    
    func testGetRecipeShouldPostFailedCallbackIfError() {
        let session = RecipleaseService(session: AlamofireSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        session.request(from: <#T##Int#>, to: <#T##Int#>, ingredients: <#T##[String]#>, completionHandler: <#T##(RecipleaseData?, Error?) -> Void#>)
        
        (weather, error) in
                XCTAssertNil(weather)
                XCTAssertNotNil(error)
                guard let error = error as? ErrorCases else {
                    XCTAssert(false)
                    return
                }
                if case ErrorCases.failure = error {
                    XCTAssert(true)
                } else {
                    XCTAssert(false)
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 0.01)
        }
}
