import Foundation

class ServiceConfiguration {

    static let sharedInstance = ServiceConfiguration()
    let environment: EnvironmentModel

    // MARK: Init
    private init() {
        environment = EnvironmentModel(mobileURL: R.url.mobile)
    }
}
