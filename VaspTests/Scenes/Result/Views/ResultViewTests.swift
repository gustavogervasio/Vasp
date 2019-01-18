@testable import Vasp
import XCTest
import UIKit

class ResultViewTests: XCTestCase {

    func testRoudLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.roundLabel.font, R.font.b16)
        XCTAssertEqual(sut.roundLabel.textColor, R.color.c_135_147_149)
    }

    func testRoundImageView() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.roundImageView.image, R.image.shape)
        XCTAssertEqual(sut.roundImageView.contentMode, .scaleAspectFit)
    }

    func testDateLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.dateLabel.font, R.font.n12)
        XCTAssertEqual(sut.dateLabel.textColor, R.color.c_135_147_149)
        XCTAssertEqual(sut.dateLabel.textAlignment, .right)
    }

    func testAirlineTitleLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.airlineTitleLabel.font, R.font.b14)
        XCTAssertEqual(sut.airlineTitleLabel.textColor, R.color.c_135_147_149)
    }

    func testAirlineTextLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.airlineTextLabel.font, R.font.n12)
        XCTAssertEqual(sut.airlineTextLabel.textColor, R.color.c_135_147_149)
    }

    func testDepartureHourTitleLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.departureHourTitleLabel.font, R.font.b14)
        XCTAssertEqual(sut.departureHourTitleLabel.textColor, R.color.c_135_147_149)
    }

    func testDepartureAirportTextLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.departureAirportTextLabel.font, R.font.n12)
        XCTAssertEqual(sut.departureAirportTextLabel.textColor, R.color.c_135_147_149)
    }

    func testDurationTitleLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.durationTitleLabel.font, R.font.b14)
        XCTAssertEqual(sut.durationTitleLabel.textColor, R.color.c_135_147_149)
    }

    func testDurationTextLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.durationTextLabel.font, R.font.n12)
        XCTAssertEqual(sut.durationTextLabel.textColor, R.color.c_135_147_149)
    }

    func testArriveHourTitleLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.arriveHourTitleLabel.font, R.font.b14)
        XCTAssertEqual(sut.arriveHourTitleLabel.textColor, R.color.c_135_147_149)
    }

    func testArriveAirportTextLabel() {
        // When
        let sut = ResultView()

        // Then
        XCTAssertEqual(sut.arriveAirportTextLabel.font, R.font.n12)
        XCTAssertEqual(sut.arriveAirportTextLabel.textColor, R.color.c_135_147_149)
    }

    func testBindView() {
        // Given
        let sut = ResultView()

        // When
        sut.bindView(round: "Ida",
                     date: "Quarta feira, 15 de março",
                     airlineTitle: "gol",
                     airlineText: "go1090",
                     departureHour: "10:40",
                     departureAirport: "cgh",
                     durationTitle: "1:00",
                     durationText: "voo direto",
                     arriveHour: "11:40",
                     arriveAirport: "cnf"
        )

        // Then
        XCTAssertEqual(sut.roundLabel.text, "IDA")
        XCTAssertEqual(sut.dateLabel.text, "Quarta feira, 15 de março")
        XCTAssertEqual(sut.airlineTitleLabel.text, "GOL")
        XCTAssertEqual(sut.airlineTextLabel.text, "GO1090")
        XCTAssertEqual(sut.departureHourTitleLabel.text, "10:40")
        XCTAssertEqual(sut.departureAirportTextLabel.text, "CGH")
        XCTAssertEqual(sut.durationTitleLabel.text, "1:00")
        XCTAssertEqual(sut.durationTextLabel.text, "VOO DIRETO")
        XCTAssertEqual(sut.arriveHourTitleLabel.text, "11:40")
        XCTAssertEqual(sut.arriveAirportTextLabel.text, "CNF")
    }
}
