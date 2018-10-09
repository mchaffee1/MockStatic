import UIKit

class ViewController: UIViewController {
    // obviously your wrappers really belong in an interactor... #🐍ftw
    var staticAPIWrapper: StaticAPIWrapperType?

    var labelText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabelText()
    }

    // super simple example of populating a (pretend) label with the output
    // from an API call.  In real life, if the API method signature was
    // synchronous like this, we'd offload the request to a background thread
    // and then bring the result back to main...
    private func loadLabelText() {
        labelText = staticAPIWrapper?.getStuff() ?? "no wrapper"
    }

    // just a helper to keep the nib/bundle info in the class
    static func create() -> ViewController {
        return ViewController(nibName: "Main", bundle: nil)
    }
}
