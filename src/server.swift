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
    static var server = IMKServer()
    static var candidates = IMKCandidates()

    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.server = IMKServer(name: Bundle.main.infoDictionary?["InputMethodConnectionName"] as? String,
            bundleIdentifier: Bundle.main.bundleIdentifier)
        AppDelegate.candidates = IMKCandidates(server: AppDelegate.server,
            panelType: kIMKSingleRowSteppingCandidatePanel)
        NSLog("tried connection")
    }

    func applicationWillTerminate(_ notification: Notification) {
    }
}
