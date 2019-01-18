@testable import Vasp
import XCTest

class ServiceConfigurationTests: XCTestCase {

    func testMobileURL() {
        XCTAssertEqual(ServiceConfiguration.sharedInstance.environment.mobileURL, R.url.mobile)
    }

    func testGoibiboId() {
        XCTAssertEqual(ServiceConfiguration.sharedInstance.environment.goibiboId, "4a4a728f")
    }

    func testGoibiboKey() {
        XCTAssertEqual(ServiceConfiguration.sharedInstance.environment.goibiboKey, "3f5d90cc56b4cd5ca6b676e083075c80")
    }
}
