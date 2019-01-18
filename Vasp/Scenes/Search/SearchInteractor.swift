import UIKit

protocol SearchInteractorInput: SearchViewControllerOutput {}

protocol SearchInteractorOutput {
    func presentSearch(search: SearchModel)
    func presentResult(search: SearchModel)
}

class SearchInteractor {

    let output: SearchInteractorOutput
    var search: SearchModel {
        didSet {
            handle()
        }
    }

    // MARK: Initializers
    init(output: SearchInteractorOutput, search: SearchModel = SearchModel()) {
        self.output = output
        self.search = search
    }

    // MARK: Internal Methods
    internal func handle() {
        output.presentSearch(search: search)
    }
}

// MARK: - SearchInteractorInput
extension SearchInteractor: SearchInteractorInput {

    // MARK: - Business logic
    func didUpdateFrom(airport: String) {
        search.from  = airport
    }

    func didUpdateTo(airport: String) {
        search.to = airport
    }

    func didUpdateDepart(date: String) {
        search.departDate = date
    }

    func didUpdateReturn(date: String) {
        search.returnDate = date
    }

    func didUpdateNumberOfPassengers(passengers: String) {
        guard let numberOfPassengers = Int(passengers) else {
            search.numberOfPassengers = 0
            return
        }
        search.numberOfPassengers = numberOfPassengers
    }

    func didTapSearchButton() {
        output.presentResult(search: search)
    }

}

