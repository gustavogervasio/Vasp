enum ErrorCode {
    case unknownError
    case codableError
}

class ResponseFailureModel {

    let message: String
    let code: ErrorCode

    init(error: Swift.Error) {
        self.message = "Custom"
        self.code = .unknownError
    }
}
