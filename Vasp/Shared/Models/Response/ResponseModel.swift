class ResponseModel<T: Codable> {

    let success: T?
    var failure: ResponseFailureModel?

    init(success: T?, error: Swift.Error?) {
        self.success = success
        self.failure = handle(error: error)
    }

    // MARK: Private Methods
    private func handle(error: Swift.Error?) -> ResponseFailureModel? {
        guard let _ = success else {
            guard let exception = error else { return nil }
            return ResponseFailureModel(error: exception)
        }
        return nil
    }
}
