struct SearchModel {

    var from: String = ""
    var to: String = ""
    var departDate: String = ""
    var returnDate: String = ""
    var numberOfPassengers = 0

    // MARK: Public Methods
    func isComplete() -> Bool {
        return from.count > 0
            && to.count > 0
            && departDate.count > 0
            && returnDate.count > 0
            && numberOfPassengers > 0
    }
}
