struct SearchResultModel: Codable {

    let dataLength: Int
    let rounds: [RoundTripModel]

    enum CodingKeys: String, CodingKey {

        case dataLength = "data_length"
        case rounds = "rounds"
    }
}
