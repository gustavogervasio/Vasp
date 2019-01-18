import Moya

protocol SearchAPIConsumerProtocol {

    func fetchSearch(
        from: String,
        to: String,
        departure: String,
        returnDate: String,
        passengers: Int,
        completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void
    )
}

class SearchAPIConsumer {

    private let provider: MoyaProvider<SearchAPI>

    init(provider: MoyaProvider<SearchAPI> = MoyaProvider<SearchAPI>()) {
        self.provider = provider
    }
}

extension SearchAPIConsumer: SearchAPIConsumerProtocol {

    func fetchSearch(from: String, to: String, departure: String, returnDate: String, passengers: Int, completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void) {


        let _ = Consumer(provider).request(.fetch(
            from: from,
            to: to,
            departure: departure,
            returnDate: returnDate,
            passengers: passengers

        )) { (response: ResponseModel<SearchResultModel>) in
            completionHandler(response)
        }
    }
}
