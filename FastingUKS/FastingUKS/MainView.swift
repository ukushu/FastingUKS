import SwiftUI

struct MainView: View {
    @ObservedObject var model = MainViewModel.shared
    
    var body: some View {
        VStack {
            FastingPeriodPlate()
            
            FastingProgressView(progress: model.progress, fastingType: model.fastingType)
        }
        .padding()
    }
}
