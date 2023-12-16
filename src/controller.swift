import InputMethodKit

class ToyimkInputController: IMKInputController {
    override func inputText(_ string: String!, client sender: Any!) -> Bool {
        NSLog(string)
        guard let client = sender as? IMKTextInput else {
            return false
        }
        client.insertText(string + "1", replacementRange: NSRange(location: NSNotFound, length: NSNotFound))
        return true
    }
}
