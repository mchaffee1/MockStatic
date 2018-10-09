import Foundation

@testable import MockStatic

// OK, here's our mock of the static API.  Note that it's a little more elaborate
// than a mock of a "regular" class or struct, in order to deal cleanly with those
// darn statics...
class MockStaticAPI: StaticAPIType {
    fileprivate typealias Class = MockStaticAPI  // this is just sugar

    static let defaultResult = "mock getStuff() result"

    static var mockGetStuffResult = Class.defaultResult
    static var getStuffCallCount = 0
    static func getStuff() -> String {
        Class.getStuffCallCount += 1
        return Class.mockGetStuffResult
    }

    // because these variables are static, we need to return them to their
    // original values after each test, where in a better world we'd just be
    // instantiating a new mock
    static func reset() {
        Class.mockGetStuffResult = Class.defaultResult
        Class.getStuffCallCount = 0
    }
}
