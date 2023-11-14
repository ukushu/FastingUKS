import SwiftUI

struct FastingProgressView: View {
    let progress: Double
    let fastingType: FastingType
    
    var body: some View {
        CircularProgressView(progress: progress, color: fastingType.color, text: fastingType.rawValue)
            .frame(width: 200, height: 200)
    }
}

struct CircularProgressView: View {
    let progress: Double
    var color = Color.pink
    var text = ""
    
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
                Text("Now is")
                    .font(.custom("SFPro", size: 13))
                    .opacity(0.7)
                
                Text(text)
                    .font(.custom("SFPro", size: 20))
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
