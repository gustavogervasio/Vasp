import UIKit

protocol ResultPresenterInput: ResultInteractorOutput {

}

protocol ResultPresenterOutput: class {

    func displaySomething(viewModel: ResultViewModel)
}

final class ResultPresenter {

    private(set) weak var output: ResultPresenterOutput?

    // MARK: - Initializers
    init(output: ResultPresenterOutput) {
        self.output = output
    }
}

// MARK: - ResultPresenterInput
extension ResultPresenter: ResultPresenterInput {

    // MARK: - Presentation logic
    func presentSomething() {
        // TODO: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ResultViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
