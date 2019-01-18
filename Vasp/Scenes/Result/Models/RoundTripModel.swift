struct RoundTripModel: Codable {

    let round1: RoundModel
    let round2: RoundModel
    let price: Float

    enum CodingKeys: String, CodingKey {

        case round1 = "round_1"
        case round2 = "round_2"
        case price = "price"
    }
}
