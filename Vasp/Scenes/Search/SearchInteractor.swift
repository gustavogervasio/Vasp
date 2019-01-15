import UIKit

protocol SearchInteractorInput: SearchViewControllerOutput {}

protocol SearchInteractorOutput {
    func presentSomething()
}

class SearchInteractor {

    let output: SearchInteractorOutput
    let worker: SearchWorkerProtocol

    // MARK: - Initializers
    init(output: SearchInteractorOutput, worker: SearchWorkerProtocol = SearchWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - SearchInteractorInput
extension SearchInteractor: SearchInteractorInput {


    // MARK: - Business logic
    func doSomething() {

        // TODO: Create some Worker to do the work
        worker.doSomeWork()

        // TODO: Pass the result to the Presenter
        output.presentSomething()
    }
}

