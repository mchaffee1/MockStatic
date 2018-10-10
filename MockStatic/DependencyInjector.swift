import Foundation

// This injector class is just here to show that there's no "special instructions" for
// instantiating or configuring a production wrapper.
// The default parameter in InjectableWrapper.init(staticAPIClass:) takes care of that.
struct DependencyInjector {
    func inject(_ viewController: ViewControllerType) {
        viewController.wrapper = InjectableWrapper()
    }
}
