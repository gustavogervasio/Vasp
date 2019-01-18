struct RoundModel: Codable {

    let date: String
    let hour: String
    let duration: String
    let fromAirport: String
    let toAirport: String
    let airlineCompany: String
    let airlineNumber: String

    enum CodingKeys: String, CodingKey {
        case date
        case hour
        case duration
        case fromAirport = "from_airport"
        case toAirport = "to_airport"
        case airlineCompany = "airline_company"
        case airlineNumber = "airline_number"
    }
}
