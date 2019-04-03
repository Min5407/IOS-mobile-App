//
//  Assignment1Tests.swift
//  Assignment1Tests
//
//  Created by Min young Go on 22/3/19.
//  Copyright © 2019 Min young Go. All rights reserved.
//

import XCTest
@testable import Assignment1

class AddViewController: XCTestCase {
    
    var objects = [Expense]()

    var final = [
    Overall(section: "List"),
    Overall(section: "Total Section"),
    Overall(section: "Overall")
    ]
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        _ = Expense(item: "movie", price: 12.3, categoryName: "education")
        _ = Expense(item: "history", price: 10, categoryName: "entertainment")
        _ = Expense(item: "ball", price: 20, categoryName: "shopping")
//
        final[0].object.append(Expense(item: "movie", price: 5, categoryName: "Education"))
        final[0].object.append(Expense(item: "movie", price: 10, categoryName: "Shopping"))
        final[0].object.append(Expense(item: "movie", price: 20, categoryName: "Entertainment"))

        XCTAssert(final[0].total() == 35)
        XCTAssert(final[0].educationTotal() == 5)
        XCTAssert(final[0].shoppingTotal() == 10)
        XCTAssert(final[0].entertainmentTotal() == 20)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testEmpty(){
        XCTAssert(final[0].total() == 0)
        XCTAssert(final[0].educationTotal() == 0)
        XCTAssert(final[0].shoppingTotal() == 0)
        XCTAssert(final[0].entertainmentTotal() == 0)

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
