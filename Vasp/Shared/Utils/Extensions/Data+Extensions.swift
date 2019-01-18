import Foundation

extension Data {

    static func mocked<T: Codable>(type: T.Type) -> Data {
        guard let path = Bundle.main.path(forResource: String(describing: type), ofType: "json") else { return Data() }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            return Data()
        }
    }

    static func codable<T: Codable>(type: T.Type) -> T? {
        let parser = Parser<T>(jsonData: mocked(type: T.self))
        let parsed = parser.response()
        guard let response = parsed.response  else { return nil }
        return response
    }
}

