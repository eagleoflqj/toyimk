import Cocoa
import InputMethodKit

class NSManualApplication: NSApplication {
    private let appDelegate = AppDelegate()

    override init() {
        super.init()
        self.delegate = appDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("Unreachable path")
    }
}

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var server = IMKServer()

    func applicationDidFinishLaunching(_ notification: Notification) {
        server = IMKServer(name: Bundle.main.infoDictionary?["InputMethodConnectionName"] as? String,
            bundleIdentifier: Bundle.main.bundleIdentifier)
        NSLog("tried connection")
    }

    func applicationWillTerminate(_ notification: Notification) {
    }
}
