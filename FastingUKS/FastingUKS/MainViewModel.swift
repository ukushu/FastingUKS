import Foundation
import MoreSwiftUI

class MainViewModel: ObservableObject {
    static let shared = MainViewModel()
    
    @Published var sheet = SheetDialogType.none
    
    @Published var progress: Double = 0.0
    @Published var fastingType: FastingType = .Eating
    
    private init() {
        refresh()
    }
    
    func refresh() {
        let dateStart = getStartDate()
        let dateNow = Date.now
        
        let hours = Calendar.current.dateComponents([.hour], from: dateStart, to: dateNow).hour!
        
        //24/24
        self.progress = Double(hours % 24) / 24
        // for 24/24
        self.fastingType = hours/24 % 2 == 0 ? .Fasting : .Eating
        
        print(self.fastingType)
    }
}


/////////////////
//HELPERS
////////////////

func getStartDate() -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale.current
    return dateFormatter.date(from: "2023-11-13T00:00:00")! // replace Date String
}
