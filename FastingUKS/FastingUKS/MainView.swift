import SwiftUI
import MoreSwiftUI
import Essentials

struct MainView: View {
    @ObservedObject var model = MainViewModel.shared
    
    let timer = TimerPublisher(every: 2)
    
    var body: some View {
        VStack {
            FastingPeriodPlate()
            
            FastingProgressView(progress: model.progress, fastingType: model.fastingType, timeLeft: model.timeLeft)
        }
        .frame(minWidth: 250, idealWidth: 250, minHeight: 280, idealHeight: 280)
        .makeFullyIntaractable()
        .gesture( TapGesture(count: 2).onEnded { twoTaps() } )
        .sheet(sheet: model.sheet)
        .onReceive(timer) { _ in
            model.refresh()
        }
    }
}

extension MainView {
    func twoTaps() {
        let view = AnyView( EditFastingView() )
        
        model.sheet = .view(view: view)
    }
}
