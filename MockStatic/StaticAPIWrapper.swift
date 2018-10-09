import Foundation

// So, easy parts first, we're going to write a mockable wrapper class so we don't have untestable calls in our
// application code.  Check out ViewController and its tests to see a consumer in action...

protocol StaticAPIWrapperType {
    func getStuff() -> String
}

struct StaticAPIWrapper {
    func getStuff() -> String {
        return StaticAPI.getStuff()
    }
}

// And then please proceed to InjectableAPIWrapper.swift to see static mocking at work.
