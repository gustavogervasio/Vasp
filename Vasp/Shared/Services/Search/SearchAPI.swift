import Moya

enum SearchAPI {
    case fetch(from: String, to: String, departure: String, returnDate: String, passengers: Int)
}

extension SearchAPI: TargetType {

    var baseURL: URL {
        return ServiceConfiguration.sharedInstance.environment.mobileURL
    }

    var path: String {
        return "/api/search"
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data.mocked(type: SearchResultModel.self)
    }

    var task: Task {

        switch self {
        case .fetch(let from, let to, let departure, let returnDate, let passengers):

            return .requestParameters(parameters: [
                "app_id": ServiceConfiguration.sharedInstance.environment.goibiboId,
                "app_key": ServiceConfiguration.sharedInstance.environment.goibiboKey,
                "source": from,
                "destination": to,
                "dateofdeparture": departure,
                "dateofarrival": returnDate,
                "adults": passengers
            ], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }
}
