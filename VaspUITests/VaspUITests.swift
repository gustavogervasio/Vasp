//
//  VaspUITests.swift
//  VaspUITests
//
//  Created by Gustavo Gervásio on 1/15/19.
//  Copyright © 2019 Gustavo Gervásio. All rights reserved.
//

import XCTest

class VaspUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testFlow() {

        let app = XCUIApplication()
        let fromTextField = app.textFields["IATA Origem"]
        fromTextField.tap()
        fromTextField.typeText("CGH")

        let toTextField = app.textFields["IATA Destino"]
        toTextField.tap()
        toTextField.typeText("CNF")

        let departureDate = app.textFields["Data da ida"]
        departureDate.tap()
        departureDate.typeText("09102019")

        let returnDate = app.textFields["Data da volta"]
        returnDate.tap()
        returnDate.typeText("10102019")

        let passengers = app.textFields["Quantidade de passageiros"]
        passengers.tap()
        passengers.typeText("1")
        fromTextField.tap()

        let btn = app.buttons["Pesquisar passagens"]
        btn.tap()

        sleep(5)

        XCTAssertTrue(app.tables.firstMatch.exists)
    }

}
