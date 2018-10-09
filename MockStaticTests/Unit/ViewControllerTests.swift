import Foundation
import Quick
import Nimble

@testable import MockStatic

class ViewControllerTests: QuickSpec {
    override func spec() {
        var mockWrapper: MockWrapper!
        var viewController: ViewController!

        // Instantiate a mock wrapper and inject it into viewController
        beforeEach {
            mockWrapper = MockWrapper()
            viewController = ViewController.create()
            viewController.wrapper = mockWrapper
        }

        // IRL we wouldn't have an API call coming straight out of the
        // view controller.  Only doing it here for simplicity...
        it("puts wrapper getStuff() result in its labelText on load") {
            viewController.viewDidLoad()

            expect(mockWrapper.getStuffCallCount) == 1
            expect(viewController.labelText) == mockWrapper.mockGetStuffResult
        }
    }
}
