//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import Foundation

public extension UIView {

    func listenForKeyboardEvents() {
        KeyboardRectCloneView.shared.subscribe(self)
    }

    func stopListeningForKeyboardEvents() {
        KeyboardRectCloneView.shared.unsubscribe(self)
    }
}
