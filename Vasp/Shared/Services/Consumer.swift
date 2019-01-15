import UIKit
import Moya

enum ConsumerError: Swift.Error {
    case codable
    case custom(data: Any?)
    case unknown
}

typealias ConsumerCompletion<T: Codable> = (ResponseModel<T>) -> Void

class Consumer<Target: TargetType>: NSObject {

    let provider: MoyaProvider<Target>
    init(_ aProvider: MoyaProvider<Target>) {
        provider = aProvider
        super.init()
    }

    func request<T: Codable>(_ target: Target, completion: @escaping ConsumerCompletion<T>) -> Cancellable {

        let cancellable = provider.request(target) { result -> Void in

            func handle(error: Swift.Error) {
                completion(ResponseModel<T>(success: nil, error: error))
            }
            func handle(response: T) {
                completion(ResponseModel<T>(success: response, error: nil))
            }

            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode

                guard statusCode == 200 || statusCode == 201 || statusCode == 202 || statusCode == 204 else {

                    return handle(
                        error: ConsumerError.custom(
                            data: ErrorParser (jsonData: data).response()
                        )
                    )
                }

                let parser = Parser<T>(jsonData: data)
                let parsed = parser.response()

                if let validResponse = parsed.response {
                    handle(response: validResponse)
                } else if let error = parsed.error {
                    handle(error: error)
                } else {
                    handle(error: ConsumerError.codable)
                }

            case let .failure(error):
                handle(error: error)
            }
        }
        return cancellable
    }
}

