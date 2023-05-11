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
    HStack (alignment:.top){
      
      ZStack{
        // MARK: Place Holder Ring
        Circle()
          .stroke(lineWidth: 20)
          .foregroundColor(.gray)
          .opacity(0.4)
        // MARK: Colored Ring
        Circle()
          .trim(from: 0, to : min (percentage,1))
          .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)),Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), center: .center),style: StrokeStyle(lineWidth: 15,lineCap: .round, lineJoin: .round))
          .rotationEffect((Angle(degrees:-90)))
          .animation(.default,value: percentage)
        VStack{
          Text("Concluído")
            .opacity(0.7)
          Text(percentage.formatted(.percent))
            .font(.title3)
            .fontWeight(.bold)
        }
      }.foregroundColor(.primary).frame(maxWidth: 200)
       
    }.frame(maxWidth: .infinity).padding(30)
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
