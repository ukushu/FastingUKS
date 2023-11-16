import Foundation
import SwiftUI

public extension View {
    func onAppWillUpdate(action: @escaping () -> ()) -> some View {
        self.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in action() } )
    }
}
