import Foundation
import Quick
import Nimble

@testable import MockStatic

class DependencyInjectorTests: QuickSpec {
    override func spec() {
        var dependencyInjector: DependencyInjector!

        beforeEach {
            dependencyInjector = DependencyInjector()
        }

        it("injects an InjectableWrapper") {
            MockStaticAPI.resetMock()  // just in case
            let mockViewController = MockViewController()

            dependencyInjector.inject(mockViewController)

            expect(mockViewController.wrapperSetCount) == 1
            let wrapper = mockViewController.wrapper
            expect(wrapper).to(beAKindOf(InjectableWrapper.self))
            expect(wrapper?.getStuff()) == StaticAPI.getStuff()
        }
    }
}
