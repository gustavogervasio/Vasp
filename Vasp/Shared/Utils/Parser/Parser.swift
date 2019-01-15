import Foundation

class Parser<T: Codable> {

    let jsonData: Data

    // MARK: Init
    init(jsonData data: Data) {
        jsonData = data
    }

    // MARK: Public Methods
    func response() -> (response: T?, error: Swift.Error?) {
        do {
            #if DEBUG
            print(try JSONSerialization.jsonObject(with: jsonData, options: []))
            #endif

            let object = try JSONDecoder().decode(T.self, from: jsonData)
            return (object, error: nil)

        } catch let error {
            return (nil, error: error)
        }
    }
}

