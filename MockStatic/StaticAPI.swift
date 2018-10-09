import Foundation

// Imagine your app needs to call this function.  Imagine furthermore that it's in a
// closed-source library, or, worse, Cocoa...
class StaticAPI {
    static func getStuff() -> String {
        return "You totally called StaticAPI.getStuff()"
    }
}
