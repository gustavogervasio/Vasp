import UIKit

protocol ResultInteractorInput: ResultViewControllerOutput {}

protocol ResultInteractorOutput {
    func presentSomething()
}

class ResultInteractor {

    let output: ResultInteractorOutput
    let worker: ResultWorkerProtocol

    // MARK: - Initializers
    init(output: ResultInteractorOutput, worker: ResultWorkerProtocol = ResultWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - ResultInteractorInput
extension ResultInteractor: ResultInteractorInput {


    // MARK: - Business logic
    func doSomething() {

        // TODO: Create some Worker to do the work
        worker.doSomeWork()

        // TODO: Pass the result to the Presenter
        output.presentSomething()
    }
}

