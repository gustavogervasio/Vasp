import UIKit

protocol ResultWorkerProtocol {

    func fetchSearch(search: SearchModel, completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void)
}

class ResultWorker {

    private var consumer: SearchAPIConsumerProtocol

    init(consumer: SearchAPIConsumerProtocol = SearchAPIConsumer()) {
        self.consumer = consumer
    }
}

extension ResultWorker: ResultWorkerProtocol {

    func fetchSearch(search: SearchModel, completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void) {

        // Get Mock data instead request
        guard let result = Data.codable(type: SearchResultModel.self) else {
            completionHandler(ResponseModel(success: nil, error: ConsumerError.unknown))
            return
        }
        completionHandler(ResponseModel(success: result, error: nil))

        /*
        consumer.fetchSearch(
            from: search.from,
            to: search.to,
            departure: search.departDate,
            returnDate: search.returnDate,
            passengers: search.numberOfPassengers
            
        ){ response in
            completionHandler(response)
        }*/
    }
}

