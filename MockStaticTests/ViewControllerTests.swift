import Foundation
import Quick
import Nimble

@testable import MockStatic

class ViewControllerTests: QuickSpec {
    override func spec() {
        var mockWrapper: MockStaticAPIWrapper!
        var viewController: ViewController!

        beforeEach {
            mockWrapper = MockStaticAPIWrapper()
            viewController = ViewController.create()
            viewController.staticAPIWrapper = mockWrapper
        }

        it("puts wrapper getStuff() result in its labelText") {
            viewController.viewDidLoad()

            expect(mockWrapper.getStuffCallCount) == 1
            expect(viewController.labelText) == mockWrapper.mockGetStuffResult
        }
    }
}
