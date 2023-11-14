import Foundation
import SwiftUI

struct GlowModifier: ViewModifier {
    var radius: CGFloat = 5
    var duration: CGFloat = 1
    @State private var flag = false
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: flag ? radius : 0)
                .animation(.easeInOut(duration: duration).repeatForever(), value: flag)
                .onAppear {
                    flag.toggle()
                }
            
            content
        }
    }
}
