import Foundation

// So, easy parts first, we're going to write a mockable wrapper class so we don't have
// untestable calls in our application code.  Check out ViewController and its tests to
// see a consumer in action.
protocol WrapperType {
    func getStuff() -> String
}

// This is just an illustration of the static-wrapper pattern in isolation; in this sample
// app it's unused, because we're using the enhanced InjectableWrapper instead.
struct Wrapper {
    func getStuff() -> String {
        return StaticAPI.getStuff()
    }
}
