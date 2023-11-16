import SwiftUI

struct FastingPeriodPlate: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("24:24")
            .font(.custom("SF Pro", size: 20))
            .foregroundColor(colorScheme == .dark ? .orange : .black.opacity(0.6))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
    }
}
