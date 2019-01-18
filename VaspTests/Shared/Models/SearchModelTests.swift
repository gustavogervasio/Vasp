@testable import Vasp
import XCTest

class SearchModelTests: XCTestCase {

    func testInit() {

        let search = SearchModel(
            from: "CGH",
            to: "CNF",
            departDate: "10/10/2019",
            returnDate: "10/10/2020",
            numberOfPassengers: 1
        )

        XCTAssertEqual(search.from, "CGH")
        XCTAssertEqual(search.to, "CNF")
        XCTAssertEqual(search.departDate, "10/10/2019")
        XCTAssertEqual(search.returnDate, "10/10/2020")
        XCTAssertEqual(search.numberOfPassengers, 1)
    }

    func testSetFrom() {
        var search = SearchModel()
        search.from = "CGH"
        XCTAssertEqual(search.from, "CGH")
    }

    func testSetTo() {
        var search = SearchModel()
        search.to = "CNF"
        XCTAssertEqual(search.to, "CNF")
    }

    func testSetDepartDate() {
        var search = SearchModel()
        search.departDate = "10/10/2019"
        XCTAssertEqual(search.departDate, "10/10/2019")
    }

    func testSetReturnDate() {
        var search = SearchModel()
        search.returnDate = "10/10/2020"
        XCTAssertEqual(search.returnDate, "10/10/2020")
    }

    func testSetNumberOfPassengers() {
        var search = SearchModel()
        search.numberOfPassengers = 1
        XCTAssertEqual(search.numberOfPassengers, 1)
    }

    func testComplete() {
        var search = SearchModel()
        XCTAssertFalse(search.isComplete())
        search.from = "CGH"
        XCTAssertFalse(search.isComplete())
        search.to = "CNF"
        XCTAssertFalse(search.isComplete())
        search.departDate = "10/10/2019"
        XCTAssertFalse(search.isComplete())
        search.returnDate = "10/10/2020"
        XCTAssertFalse(search.isComplete())
        search.numberOfPassengers = 1
        XCTAssertTrue(search.isComplete())
    }
}
