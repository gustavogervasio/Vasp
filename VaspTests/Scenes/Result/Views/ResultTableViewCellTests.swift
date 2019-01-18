@testable import Vasp
import XCTest
import UIKit

class ResultTableViewCellTests: XCTestCase {

    func testShouldHaveAnIndentifier() {
        // Then
        XCTAssertEqual(ResultTableViewCell.identifier, "resultTableViewCell")
    }

    func testSelectionStyleShouldBeNone() {
        // Then
        let cell = ResultTableViewCell()

        // When
        XCTAssertEqual(cell.selectionStyle, .none)
    }

    func testeShouldSetContentViewBackgroundColor() {
        // Then
        let cell = ResultTableViewCell()

        // When
        XCTAssertEqual(cell.contentView.backgroundColor, UIColor.groupTableViewBackground)
    }

    func testBindViewShoulCallBindViewOfDepartRoundView() {
        // Given
        let cell = ResultTableViewCell()
        let departRoundViewSpy = ResultViewSpy()
        cell.departRoundView = departRoundViewSpy

        let round = ResultRoundViewModel(
            date: "10/10/2019",
            hour: "10:10",
            duration: "1H00",
            fromAirport: "CGH",
            toAirport: "CNF",
            airlineCompany: "LATAM",
            airlineNumber: "TT0019"
        )

        let result = ResultViewModel(
            round1: round,
            round2: round,
            price: "R$190,00"
        )
        // When
        cell.bindView(result: result)

        // Then
        XCTAssertTrue(departRoundViewSpy.bindViewCalled)
    }

    func testBindViewShoulCallBindViewOfReturnRoundView() {
        // Given
        let cell = ResultTableViewCell()
        let returnRoundViewSpy = ResultViewSpy()
        cell.returnRoundView = returnRoundViewSpy

        let round = ResultRoundViewModel(
            date: "10/10/2019",
            hour: "10:10",
            duration: "1H00",
            fromAirport: "CGH",
            toAirport: "CNF",
            airlineCompany: "LATAM",
            airlineNumber: "TT0019"
        )

        let result = ResultViewModel(
            round1: round,
            round2: round,
            price: "R$190,00"
        )
        // When
        cell.bindView(result: result)

        // Then
        XCTAssertTrue(returnRoundViewSpy.bindViewCalled)
    }

    func testBindViewShoulSetBuyButtonTitle() {
        // Given
        let cell = ResultTableViewCell()

        let round = ResultRoundViewModel(
            date: "10/10/2019",
            hour: "10:10",
            duration: "1H00",
            fromAirport: "CGH",
            toAirport: "CNF",
            airlineCompany: "LATAM",
            airlineNumber: "TT0019"
        )

        let result = ResultViewModel(
            round1: round,
            round2: round,
            price: "R$190,00"
        )
        // When
        cell.bindView(result: result)

        // Then
        XCTAssertEqual(cell.buyButton.title(for: .normal), String(format: R.string.btnBuyTitle, "R$190,00"))
    }

    class ResultViewSpy: ResultView {

        var bindViewCalled = false

        override func bindView(
            round: String,
            date: String,
            airlineTitle: String,
            airlineText: String,
            departureHour: String,
            departureAirport: String,
            durationTitle: String,
            durationText: String,
            arriveHour: String,
            arriveAirport: String) {

            bindViewCalled = true
        }
    }
}
