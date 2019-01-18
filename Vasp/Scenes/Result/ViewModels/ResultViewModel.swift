struct ResultRoundViewModel {
    let date: String
    let hour: String
    let duration: String
    let fromAirport: String
    let toAirport: String
    let airlineCompany: String
    let airlineNumber: String
}

struct ResultViewModel {
    let round1: ResultRoundViewModel
    let round2: ResultRoundViewModel
    let price: String
}
