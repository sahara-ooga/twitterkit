//
//  loadCredentialTests.swift
//  twitterkitTests
//
//  Created by yogasawara@stv on 2018/03/21.
//  Copyright © 2018年 sunday carpenter. All rights reserved.
//

import XCTest
@testable import twitterkit

class loadCredentialTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialize() {
        let jsonName = "credential"
        
        do {
            let credential = try TwitterAPICredential(json: jsonName)
            XCTAssertFalse(credential.consumer_key.isEmpty)
            XCTAssertFalse(credential.consumer_secret.isEmpty)
        } catch {
            print("Error has taken place >>>>>>>> \(error)")
            XCTFail("fail to decode json to credential type")
        }
    }
}
