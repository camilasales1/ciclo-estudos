//
//  Ring.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 10/05/23.
//

import SwiftUI

struct Ring: View{
  @State var clock = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect()
  @State var progressRingViewModel = ProgressRingViewModel()
  @State var totalTime: Double
  @State var remainingTime: Double
  @State var isOn: Bool = false
  @State var elapsedTime:Double
  @State var percentage:Double
    
  
  var body: some View {
    
      ZStack{
        // MARK: Place Holder Ring
        Circle()
          .stroke(lineWidth: 20)
          .foregroundColor(.gray)
          .opacity(0.4)
        // MARK: Colored Ring
        Circle()
          .trim(from: 0, to : min (percentage,1))
          .stroke(AngularGradient(gradient: Gradient(colors: [Color("blue 1"),Color("blue 2"),Color("blue 3"),Color.white]), center: .center),style: StrokeStyle(lineWidth: 15,lineCap: .round, lineJoin: .round))
          .rotationEffect((Angle(degrees:-90)))
          .animation(.default,value: percentage)
        VStack{
          Text("Concluído")
            .opacity(0.7)
          Text(String(format: "%.2f%%", percentage*100))
        }
        .font(.title)
        .fontWeight(.bold)
      }
      .padding()
      .frame(maxWidth: .infinity)
      .onAppear(){
        elapsedTime = totalTime - remainingTime
        
        percentage = (elapsedTime / totalTime)
      }

  }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
      Ring(totalTime: 10, remainingTime: 5, elapsedTime: 5, percentage: 0)
      
    }
}
