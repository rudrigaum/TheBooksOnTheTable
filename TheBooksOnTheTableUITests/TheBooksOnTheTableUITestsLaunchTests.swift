//
//  TheBooksOnTheTableUITestsLaunchTests.swift
//  TheBooksOnTheTableUITests
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import XCTest

final class TheBooksOnTheTableUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
