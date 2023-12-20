import InputMethodKit

class ToyimkInputController: IMKInputController {
    var candidateWord: String = ""
    var currentClient: Any! = nil

    override func inputText(_ string: String!, client sender: Any!) -> Bool {
        NSLog(string)
        guard let client = sender as? IMKTextInput else {
            return false
        }
        if string == " " {
            commit(client, candidateWord + " ")
            return true
        }
        currentClient = client
        candidateWord += string
        AppDelegate.candidates.update()
        AppDelegate.candidates.show()
        return true
    }

    override func candidates(_ sender: Any!) -> [Any]! {
        return [candidateWord]
    }

    override func candidateSelected(_ candidateString: NSAttributedString!) {
        guard let aString = candidateString,
            let client = currentClient as? IMKTextInput else {
            return
        }
        commit(client, aString.string)
    }

    func commit(_ client: IMKTextInput, _ text: String) {
        candidateWord = ""
        AppDelegate.candidates.hide()
        client.insertText(text, replacementRange: NSRange(location: NSNotFound, length: NSNotFound))
    }
}
