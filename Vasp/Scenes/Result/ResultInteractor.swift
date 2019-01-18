import UIKit

protocol ResultInteractorInput: ResultViewControllerOutput {}

protocol ResultInteractorOutput {
    func presentSearchResult(searchResult: SearchResultModel)
    func presentError(error: ResponseFailureModel)
}

class ResultInteractor {

    let output: ResultInteractorOutput
    let worker: ResultWorkerProtocol
    internal var result: SearchResultModel?

    // MARK: - Initializers
    init(output: ResultInteractorOutput, worker: ResultWorkerProtocol = ResultWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - ResultInteractorInput
extension ResultInteractor: ResultInteractorInput {

    // MARK: - Business logic
    func fetchSearch(search: SearchModel) {

        worker.fetchSearch(search: search) { [weak self] response in

            if let success = response.success {

                self?.result = success
                self?.output.presentSearchResult(searchResult: success)

            } else if let error = response.failure {

                self?.output.presentError(error: error)
            }
        }
    }

    func sortByPrice() {
        guard let result = self.result else { return }

        let rounds = result.rounds.sorted(by: {$0.price < $1.price})
        let sortedResult = SearchResultModel(dataLength: result.dataLength, rounds: rounds)
        output.presentSearchResult(searchResult: sortedResult)
    }

    func filterByAirline(airline: String) {
        guard let result = self.result else { return }

        if airline.count > 0 {

            let rounds = result.rounds.filter({$0.round1.airlineCompany.uppercased() == airline.uppercased()})

            let filteredResult = SearchResultModel(dataLength: result.dataLength, rounds: rounds)
            output.presentSearchResult(searchResult: filteredResult)

        } else {
            
            output.presentSearchResult(searchResult: result)
        }
    }
}

