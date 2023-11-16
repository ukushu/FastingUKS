import Foundation
import SwiftUI

struct GlowModifier: ViewModifier {
    var radius: CGFloat = 5
    var duration: CGFloat = 1
    @State private var flag = false
    
    var animation: Animation {
        [
            Animation.easeIn(duration: duration),
            Animation.easeInOut(duration: duration),
            Animation.easeOut(duration: duration),
            Animation.linear(duration: duration),
        ]
        .randomElement()!
        .repeatForever()
    }
    
    func body(content: Content) -> some View {
        content
            .background {
                content
                    .padding(.top, flag ? 0 : radius )
                    .opacity(flag ? 1 : 0 )
                    .blur(radius: flag ? radius : 0)
                    .animation(animation, value: flag)
                    .onAppear {
                        flag.toggle()
                    }
            }
    }
}
