import Foundation

@testable import MockStatic

class MockViewController: ViewControllerType {
    var wrapperSetCount = 0
    var wrapper: WrapperType? {
        didSet {
            wrapperSetCount += 1
        }
    }

    var labelTextSetCount = 0
    var labelText: String = "" {
        didSet {
            labelTextSetCount += 1
        }
    }
}
