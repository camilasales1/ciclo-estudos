//
//  StudyCicleView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
struct StudyCicleViewModel{
   var studyCicle:StudyCicle = DummyData.studyCicle
//  var totalOfQuestions:Int{
//    
//  }
   
}
  
  struct StudyCicleView: View {
    @EnvironmentObject var dataBase : DataBase
    @State var studyCicleViewModel = StudyCicleViewModel()
    var body: some View {
      
      Group{
        VStack {
          Text(studyCicleViewModel.studyCicle.name)
          Text("Dias para prova: \(studyCicleViewModel.studyCicle.testDate.daysToDate)")
          Text("Dias por Semana: \(studyCicleViewModel.studyCicle.studyWeekTime.count )")
          Text("Tempo para estudo diário: " + String(studyCicleViewModel.studyCicle.studyDailyTime ))
          Text("Total de horas de estudo: \(studyCicleViewModel.studyCicle.totalHours )")
          List{
            ForEach(studyCicleViewModel.studyCicle.subjects, id:\.self){
              subject in Section("\(subject.name)"){
                Text(subject.name)
                
                
//       ForEach(stats_Data){ stat in //linha 251
//
//                  VStack(spacing: 32) {
//
//                    HStack {
//                      Text(subject.name)
//                        .font(.system(size:22))
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//
//                      Spacer(minLength: 0)
//                    }
//
//                    // Rings...
//
//                    ZStack {
//
//                      Circle()
//                        .trim(from: 0, to: 1)
//                        .stroke(stat.color.opacity(0.20), lineWidth: 10)
//                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
//
//                      Circle()
//                        .trim(from: 0, to: (stat.currentData / stat.goal))
//                        .stroke(stat.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
//
//                      Text("porcentagem do progresso")
//                        .font(.system(size: 22))
//                        .fontWeight(.bold)
//                        .foregroundColor(stat.color)
//                        .rotationEffect(.init(degrees: 90))
//
//                    }
//                    .rotationEffect(.init(degrees: -90))
//
//                  .padding()
//                  .background(Color.white.opacity(0.06))
//                  .cornerRadius(15)
//                  .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 0)
//                }
//              }
                Text("Peso: " + String(format: "%.2f", subject.weight))
                Text("Dificuldade com a matéria: " + subject.dificult.description)
                Text("Total de questões: \(subject.totalQuestions)")
                Text("Tempo restante: \(subject.remainingTime ?? 0000) s")
              }
            }                                                        }.listStyle(.sidebar)
        }
      }.onAppear(){
        studyCicleViewModel.studyCicle = dataBase.studyCicle
        print(studyCicleViewModel.studyCicle.name)
      }
    }
  }

struct StudyCicleView_Previews: PreviewProvider {
    static var previews: some View {
      StudyCicleView().environmentObject(DataBase())
    }
}
