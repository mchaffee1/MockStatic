import Foundation
import Quick
import Nimble

@testable import MockStatic

class IntegrationTests: QuickSpec {
    override func spec() {
        var viewController: ViewController!
        var wrapper: WrapperType!

        beforeEach {
            wrapper = InjectableWrapper(staticAPIClass: MockStaticAPI.self)
            viewController = ViewController.create()
            viewController.wrapper = wrapper
            MockStaticAPI.resetMock()
        }

        it("actually gets stuff from the API to the viewController") {
            let expectedResult = "integration mock result"
            MockStaticAPI.mockGetStuffResult = expectedResult

            viewController.viewDidLoad()

            expect(MockStaticAPI.getStuffCallCount) == 1
            expect(viewController.labelText) == expectedResult
        }
    }
}
