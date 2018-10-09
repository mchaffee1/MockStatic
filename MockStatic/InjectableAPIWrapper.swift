import Foundation

// So to make an injectable API wrapper, first we declare a protocol which
// describes all the static methods we need to mock...
protocol StaticAPIType {
    static func getStuff() -> String
}

// ...then declare conformance of the real API class...
extension StaticAPI: StaticAPIType {}

// Now, let's create an injectable wrapper!
struct InjectableAPIWrapper {
    private var API: StaticAPIType.Type

    init(staticAPIClass: StaticAPIType.Type = StaticAPI.self) {
        API = staticAPIClass
    }

    func getStuff() -> String {
        return API.getStuff()
    }
}
