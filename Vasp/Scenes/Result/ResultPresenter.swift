import UIKit

protocol ResultPresenterInput: ResultInteractorOutput {}

protocol ResultPresenterOutput: class {

    func displayViewModel(viewModel: [ResultViewModel])
    func displayError(viewModel: ErrorViewModel)
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

    func presentSearchResult(searchResult: SearchResultModel) {

        let results = searchResult.rounds.map (
            {
                ResultViewModel(
                    round1: ResultRoundViewModel(
                        date: $0.round1.date,
                        hour: $0.round1.hour,
                        duration: $0.round1.duration,
                        fromAirport: $0.round1.fromAirport,
                        toAirport: $0.round1.toAirport,
                        airlineCompany: $0.round1.airlineCompany,
                        airlineNumber: $0.round1.airlineNumber
                    ),
                    round2: ResultRoundViewModel(
                        date: $0.round2.date,
                        hour: $0.round2.hour,
                        duration: $0.round2.duration,
                        fromAirport: $0.round2.fromAirport,
                        toAirport: $0.round2.toAirport,
                        airlineCompany: $0.round2.airlineCompany,
                        airlineNumber: $0.round2.airlineNumber
                    ),
                    price: $0.price.currency()
                )
            }
        )

        output?.displayViewModel(viewModel: results)
    }

    func presentError(error: ResponseFailureModel) {
        output?.displayError(viewModel: ErrorViewModel(message: error.message))
    }
}
