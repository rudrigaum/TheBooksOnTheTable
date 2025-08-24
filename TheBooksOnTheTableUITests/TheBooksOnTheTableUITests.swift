//
//  TheBooksOnTheTableUITests.swift
//  TheBooksOnTheTableUITests
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import XCTest

final class TheBooksOnTheTableUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
