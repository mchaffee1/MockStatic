import Foundation

@testable import MockStatic

class MockStaticAPIWrapper: StaticAPIWrapperType {
    var mockGetStuffResult = "mock getStuff() result"
    var getStuffCallCount = 0
    func getStuff() -> String {
        getStuffCallCount += 1
        return mockGetStuffResult
    }
}
