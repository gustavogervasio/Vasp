import UIKit

protocol SearchPresenterInput: SearchInteractorOutput {}

protocol SearchPresenterOutput: class {

    func displayButton()
    func hideButton()
    func displayResult(search: SearchModel)
}

final class SearchPresenter {

    private(set) weak var output: SearchPresenterOutput?

    // MARK: - Initializers
    init(output: SearchPresenterOutput) {
        self.output = output
    }
}

// MARK: - SearchPresenterInput
extension SearchPresenter: SearchPresenterInput {

    func presentSearch(search: SearchModel) {
        
        if search.isComplete() {
            output?.displayButton()
        } else {
            output?.hideButton()
        }
    }

    func presentResult(search: SearchModel) {
        output?.displayResult(search: search)
    }

}
