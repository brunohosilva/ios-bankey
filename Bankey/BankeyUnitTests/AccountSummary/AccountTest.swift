//
//  AccountTest.swift
//  BankeyUnitTests
//
//  Created by Bruno Oliveira on 19/02/24.
//

import Foundation
import XCTest

@testable import Bankey

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.first?.id, "1")
        XCTAssertEqual(result.first?.type, .Banking)
        XCTAssertEqual(result.first?.name, "Basic Savings")
        XCTAssertEqual(result.first?.amount, 929466.23)
        XCTAssertEqual(result.first?.createdDateTime.monthDayYearString, "21/06/2010")
        
        XCTAssertEqual(result.last?.id, "2")
        XCTAssertEqual(result.last?.type, .Banking)
        XCTAssertEqual(result.last?.name, "No-Fee All-In Chequing")
        XCTAssertEqual(result.last?.amount, 17562.44)
        XCTAssertEqual(result.last?.createdDateTime.monthDayYearString, "21/06/2011")
        // Game on here 🕹
    }
}
