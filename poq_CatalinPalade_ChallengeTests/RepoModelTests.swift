//
//  RepoModelTests.swift
//  poq_CatalinPalade_ChallengeTests
//
//  Created by Catalin Palade on 24/11/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import Foundation
import XCTest

@testable import poq_CatalinPalade_Challenge

class RepoModelTests: XCTestCase {
    
    func testValidModel() {
        let repo = Repo(name: "Test Name", description: "Test Description")
        XCTAssertNotNil(repo)
    }
    
    func testJsonModel() {
        let json = ["name" : "Json Test Name", "description" : "Json Test Description"]
        let repo = Repo(json: json)
        XCTAssertNotNil(repo)
    }
}
