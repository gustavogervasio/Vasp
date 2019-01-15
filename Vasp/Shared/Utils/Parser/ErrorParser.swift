import Foundation

class ErrorParser {

    let jsonData: Data

    // MARK: Init
    init(jsonData data: Data) {
        jsonData = data
    }

    // MARK: Public Methods
    func response() -> Any? {

        do {

            let object = try JSONSerialization.jsonObject(with: jsonData, options: [])
            #if DEBUG
            print(object)
            #endif
            return object

        } catch {
            return nil
        }
    }
}
