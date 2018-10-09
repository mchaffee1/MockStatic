import UIKit

class ViewController: UIViewController {
    var staticAPIWrapper: StaticAPIWrapperType?

    var labelText = ""

    static func create() -> ViewController {
        return ViewController(nibName: "Main", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        labelText = staticAPIWrapper?.getStuff() ?? "no wrapper"
    }
}
