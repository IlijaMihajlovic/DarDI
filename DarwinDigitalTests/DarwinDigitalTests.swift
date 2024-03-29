//
//  DarwinDigitalTests.swift
//  DarwinDigitalTests
//
//  Created by Ilija Mihajlovic on 9/14/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import XCTest
@testable import DarwinDigital

class DarwinDigitalTests: XCTestCase {
    
    //system under test
    var sut: URLSession!

    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testValidCallToJSONServer() {
        
        //given
        let url = URL(string: "https://api.myjson.com/bins/w0b55")
        
        //What we expect to happen
        let promise = expectation(description: "Status code: 200 or 201")
        
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            
            //then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
                
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 || statusCode == 201 {
                    promise.fulfill()
                
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        
        //Keeps the test running until all expectations are fulfilled, or the timeout interval ends, whichever happens first.
        wait(for: [promise], timeout: 5)
    }

}
