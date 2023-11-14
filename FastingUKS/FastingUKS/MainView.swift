import SwiftUI
import MoreSwiftUI

struct MainView: View {
    @ObservedObject var model = MainViewModel.shared
    
    var body: some View {
        VStack {
            FastingPeriodPlate()
            
            FastingProgressView(progress: model.progress, fastingType: model.fastingType)
        }
        .frame(minWidth: 250, minHeight: 280)
        .makeFullyIntaractable()
        .gesture( TapGesture(count: 2).onEnded { twoTaps() } )
        .sheet(sheet: model.sheet)
    }
}

extension MainView {
    func twoTaps() {
        let view = AnyView( EditFastingView() )
        
        model.sheet = .view(view: view)
    }
}
