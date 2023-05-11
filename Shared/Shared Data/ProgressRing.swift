//
//  ProgressRing.swift
//  Fasting App
//
//  Created by Roberto Mascarenhas on 08/05/23.
//

import SwiftUI


struct ProgressRingViewModel{
  
}

struct ProgressRing: View {
  @State var isOn = false
  @State var totalTime: Double
  @State var remainingTime: Double
  var elapsedTime:Double{
    totalTime - remainingTime
  }
  var percentage:Double{(elapsedTime / totalTime)}
  @State var clock = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect()
  
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

      // MARK: Elapsed Time
      VStack(alignment: .leading, spacing:5) {
        VStack(alignment: .leading, spacing:5){
          Text("Elapsed time:")
            .opacity(0.7)
          Text(String(format: "%02d:%02d:%02d",
                      // horas
                      Int(elapsedTime/3600),
                      //minutos
                      Int((elapsedTime/60)
                        .truncatingRemainder(dividingBy: 60)),
                      //segundos
                      Int(elapsedTime.truncatingRemainder(dividingBy: 60).truncatingRemainder(dividingBy: 60))
                     )
          )
        }
        VStack(alignment: .leading, spacing:5){
          Text("Remaining time:")
          Text(String(format: "%02d:%02d:%02d",
                      Int(remainingTime)/3600, Int((remainingTime/60).truncatingRemainder(dividingBy: 60)), Int(remainingTime.truncatingRemainder(dividingBy: 60).truncatingRemainder(dividingBy: 60))
                     )
          )
        }
        Button(isOn ? "⏸️ Pause":"▶️ Start"){
          isOn.toggle()
        }
        .layoutPriority(10)
      }
      .fontWeight(.semibold)
      .font(.title3)
      .padding(.top,10)
      .padding(.leading,10)
      
        .onReceive(clock) { _ in guard isOn else{return}
          if remainingTime > 0{
            remainingTime -= 1
          }
        }
      
    }.frame(maxWidth: .infinity).padding(30)
  }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
      ProgressRing( totalTime: 0.05*60*60, remainingTime: 0.05*60*60)
    }
}

