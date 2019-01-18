import Foundation

struct ErrorViewModel {

    let title: String
    let message: String

    init(title: String = R.string.applicationName, message: String) {
        self.title = title
        self.message = message
    }
}
