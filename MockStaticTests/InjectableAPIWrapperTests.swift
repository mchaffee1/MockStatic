import Foundation
import Quick
import Nimble

@testable import MockStatic

class InjectableAPIWrapperTests: QuickSpec {
    override func spec() {
        var wrapper: InjectableAPIWrapper!

        beforeEach {
            MockStaticAPI.reset()
            wrapper = InjectableAPIWrapper(staticAPIClass: MockStaticAPI.self)
        }

        // This test checks that the wrapper calls the API once and only once,
        // and returns the correct result
        it("returns the value given by API getStuff()") {
            let expectedResult = "expected result"
            MockStaticAPI.mockGetStuffResult = expectedResult

            let result = wrapper.getStuff()
            expect(MockStaticAPI.getStuffCallCount) == 1
            expect(result) == expectedResult
        }
    }
}
