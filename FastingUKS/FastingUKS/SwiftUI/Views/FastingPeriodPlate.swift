import SwiftUI

struct FastingPeriodPlate: View {
    var body: some View {
        Text("24:24")
            .foregroundColor(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
            }
    }
}
