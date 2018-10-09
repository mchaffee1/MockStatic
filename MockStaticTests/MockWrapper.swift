import Foundation

@testable import MockStatic

// this mock of the StaticAPIWrapperType protocol is used by ViewControllerTests
class MockWrapper: WrapperType {
    var mockGetStuffResult = "mock getStuff() result"
    var getStuffCallCount = 0
    func getStuff() -> String {
        getStuffCallCount += 1
        return mockGetStuffResult
    }
}
