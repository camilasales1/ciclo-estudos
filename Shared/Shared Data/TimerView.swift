//
//  TimerView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 10/05/23.
//

import SwiftUI
//
//struct TimerView: View{
//  @State var clock = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect()
//  @State var progressRingViewModel = ProgressRingViewModel()
//  @State var totalTime: Double
//  @State var remainingTime: Double
//  @State var isOn: Bool = false
//  
//  var elapsedTime:Double{
//    totalTime - remainingTime
//  }
//  var percentage:Double{
//    (elapsedTime / totalTime)
//  }
//  var body: some View {
//    
//    // MARK: Elapsed Time
//    VStack(alignment: .leading, spacing:5) {
//      VStack(alignment: .leading, spacing:5){
//        Text("Elapsed time:")
//          .opacity(0.7)
//        Text(String(format: "%02d:%02d:%02d",
//                    // horas
//                    Int(elapsedTime/3600),
//                    //minutos
//                    Int((elapsedTime/60)
//                      .truncatingRemainder(dividingBy: 60)),
//                    //segundos
//                    Int(elapsedTime.truncatingRemainder(dividingBy: 60).truncatingRemainder(dividingBy: 60))
//                   )
//        )
//      }
//      VStack(alignment: .leading, spacing:5){
//        Text("Remaining time:")
//        Text(String(format: "%02d:%02d:%02d",
//                    Int(remainingTime)/3600, Int((remainingTime/60).truncatingRemainder(dividingBy: 60)), Int(remainingTime.truncatingRemainder(dividingBy: 60).truncatingRemainder(dividingBy: 60))
//                   )
//        )
//      }
//      Button(isOn ? "⏸️ Pause":"▶️ Start"){
//        isOn.toggle()
//      }
//      .layoutPriority(10)
//    }
//    .fontWeight(.semibold)
//    .font(.title3)
//    .padding(.top,10)
//    .padding(.leading,10)
//    .onAppear(){
//      totalTime = progressRingViewModel.totalTime
//      remainingTime = progressRingViewModel.remainingTime
//      isOn = progressRingViewModel.isOn
//    }
//    
//    .onReceive(clock) { _ in guard isOn else{return}
//      if remainingTime > 0{
//        remainingTime -= 1
//      }
//    }
//    
//  }
//}
//
//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TimerView(totalTime: 1*60*60, remainingTime: 1*60*60)
//    }
//}
