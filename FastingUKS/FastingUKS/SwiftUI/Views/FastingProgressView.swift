import SwiftUI
import MoreSwiftUI

struct FastingProgressView: View {
    let progress: Double
    let fastingType: FastingType
    let timeLeft: String
    
    var body: some View {
        CircularProgressView(progress: progress, color: fastingType.color, text: fastingType.rawValue, timeLeft: timeLeft)
            .frame(width: 200, height: 200)
    }
}

struct CircularProgressView: View {
    let progress: Double
    var color = Color.pink
    var text = ""
    let timeLeft: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: 30
                )
                .modifier(GlowModifier(radius: 10, duration: 1.5))
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            
            VStack {
                Space(15)
                
                Text("Now is")
                    .font(.custom("SFPro", size: 13))
                    .opacity(0.7)
                
                Text(text)
                    .font(.custom("SFPro", size: 20))
                
                Text(timeLeft)
                    .font(.custom("SFPro", size: 13))
                    .opacity(0.7)
                    .padding(.top, 2)
            }
        }
        .padding(15.5)
    }
}

enum FastingType: String {
    case Fasting
    case Eating
}



extension FastingType {
    var color: Color {
        switch self {
        case .Eating:
            return .green
        case .Fasting:
            return .red
        }
    }
}
