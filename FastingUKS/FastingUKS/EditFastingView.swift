import Foundation
import SwiftUI
import MoreSwiftUI

struct EditFastingView : View {
    @ObservedObject var model = MainViewModel.shared
    
    @State var hrs1 = 24
    @State var hrs2 = 24
    
    @State var dateStart = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Date Start:", selection: $dateStart, displayedComponents: .date)
            
            Space(20)
            
            HStack {
                Text("Fasting:")
                Stepper(label: { Text("\(hrs1)") }, onIncrement: { hrs1 += 1 }, onDecrement: { hrs1 -= 1})
            }
            
            HStack {
                Text("Eating: ")
                Stepper(label: { Text("\(hrs2)") }, onIncrement: { hrs2 += 1 }, onDecrement: { hrs2 -= 1})
            }
            
            Space(20)
            
            LoadTemplateBtn()
            
            Space(20)
            
            HStack {
                Button("Cancel", role: .cancel) { model.sheet = .none }
                
                Button("OK") { model.sheet = .none }
            }
        }
        .padding(25)
    }
    
    func LoadTemplateBtn() -> some View {
        PopoverButtSimple(label: { Text("Load from template") }) {
            VStack {
                HStack(alignment: .top, spacing: 30) {
                    VStack(spacing: 3) {
                        Text("Beginner:")
                        Button("12:12") { hrs1 = 12; hrs2 = 12; }
                        Button("13:11") { hrs1 = 13; hrs2 = 11; }
                        Button("14:10") { hrs1 = 14; hrs2 = 10; }
                        Button("15:9")  { hrs1 = 15; hrs2 = 9; }
                        Button("24:24") { hrs1 = 24; hrs2 = 24; }
                    }
                    
                    VStack(spacing: 3) {
                        Text("Experienced:")
                        
                        Button("48:120*") { hrs1 = 48; hrs2 = 120; }
                            .help("Fast 2 days a week")
                        
                        Button("16:8") { hrs1 = 16; hrs2 = 8; }
                        Button("17:7") { hrs1 = 17; hrs2 = 7; }
                        Button("18:6") { hrs1 = 18; hrs2 = 6; }
                    }
                    
                    VStack(spacing: 3) {
                        Text("Expert:")
                        Button("19:5") { hrs1 = 19; hrs2 = 5; }
                        Button("20:4") { hrs1 = 20; hrs2 = 4; }
                        Button("21:3") { hrs1 = 21; hrs2 = 3; }
                        Button("22:2") { hrs1 = 22; hrs2 = 2; }
                    }
                }
            }
            .buttonStyle(BtnUksStyle.default)
            .padding(25)
        }
    }
}
