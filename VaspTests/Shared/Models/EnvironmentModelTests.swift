@testable import Vasp
import XCTest

class EnvironmentModelTests: XCTestCase {

    func testMobileURL() {
        let env = EnvironmentModel(mobileURL: URL(string: "https://www.test.com.br")!)
        XCTAssertEqual(env.mobileURL, URL(string: "https://www.test.com.br"))
    }

    func testGoibiboId() {
        let env = EnvironmentModel(mobileURL: URL(string: "https://www.test.com.br")!)
        XCTAssertEqual(env.goibiboId, "4a4a728f")
    }

    func testGoibiboKey() {
        let env = EnvironmentModel(mobileURL: URL(string: "https://www.test.com.br")!)
        XCTAssertEqual(env.goibiboKey, "3f5d90cc56b4cd5ca6b676e083075c80")
    }

}

