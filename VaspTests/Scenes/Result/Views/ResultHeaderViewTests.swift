@testable import Vasp
import XCTest
import UIKit

class ResultHeaderViewTests: XCTestCase {

    func testInitShouldSetBackgroundColor() {
        // When
        let sut = ResultHeaderView()

        // Then
        XCTAssertEqual(sut.backgroundColor, R.color.c_135_147_149)
    }

    func testAirlineLabel() {
        // When
        let sut = ResultHeaderView()

        // Then
        XCTAssertEqual(sut.airlineLabel.font, R.font.n14)
        XCTAssertEqual(sut.airlineLabel.textColor, .white)
        XCTAssertEqual(sut.airlineLabel.text, R.string.airlineTitle)
    }

    func testDepartureTitle() {
        // When
        let sut = ResultHeaderView()

        // Then
        XCTAssertEqual(sut.departureTitle.font, R.font.n14)
        XCTAssertEqual(sut.departureTitle.textColor, .white)
        XCTAssertEqual(sut.departureTitle.text, R.string.departureTitle)
    }

    func testDurationTitle() {
        // When
        let sut = ResultHeaderView()

        // Then
        XCTAssertEqual(sut.durationTitle.font, R.font.n14)
        XCTAssertEqual(sut.durationTitle.textColor, .white)
        XCTAssertEqual(sut.durationTitle.text, R.string.durationTitle)
    }

    func testArriveTitle() {
        // When
        let sut = ResultHeaderView()

        // Then
        XCTAssertEqual(sut.arriveTitle.font, R.font.n14)
        XCTAssertEqual(sut.arriveTitle.textColor, .white)
        XCTAssertEqual(sut.arriveTitle.text, R.string.arriveTitle)
    }
}
