import UIKit

protocol SearchPresenterInput: SearchInteractorOutput {

}

protocol SearchPresenterOutput: class {

    func displaySomething(viewModel: SearchViewModel)
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

    // MARK: - Presentation logic
    func presentSomething() {
        // TODO: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SearchViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
