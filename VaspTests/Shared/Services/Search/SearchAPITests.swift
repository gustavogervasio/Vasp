@testable import Vasp
@testable import Moya
import XCTest

class SearchAPITests: XCTestCase {

    func testSearchAPI() {
        let sut = SearchAPI.fetch(
            from: "CGH",
            to: "CNF",
            departure: "20191010",
            returnDate: "20191011",
            passengers: 1
        )
        XCTAssertEqual(sut.baseURL, R.url.mobile)
        XCTAssertEqual(sut.path, "/api/search")
        XCTAssertEqual(sut.method, Moya.Method.get)
        XCTAssertNil(sut.headers)
    }
}
