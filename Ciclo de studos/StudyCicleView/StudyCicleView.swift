//
//  StudyCicleView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
class StudyCicleViewModel:ObservableObject{
  @Published var studyCicle:StudyCicle
  init(studyCicle: StudyCicle) {
    self.studyCicle = studyCicle
  }
  
}

struct StudyCicleView: View {
  @ObservedObject var studyCicleViewModel = StudyCicleViewModel(studyCicle: DummyData.studyCicle)
    var body: some View {
       
      Group{
        VStack {
          Text(studyCicleViewModel.studyCicle.name)
          Text("Data da prova: \(studyCicleViewModel.studyCicle.testDate.formatted(date: .abbreviated, time: .omitted))")
          Text("Tempo para estudo diário: " + String(studyCicleViewModel.studyCicle.StudyDailyTime))
          Text("Total de horas de estudo: \(studyCicleViewModel.studyCicle.TotalHours)")
          List{
            ForEach(studyCicleViewModel.studyCicle.subjects, id:\.self){
              subject in Section("\(subject.name)"){
                
                  Text(subject.name)
                  Text("\(subject.weight)")
                Text("Dificuldade com a matéria: " + subject.dificult.description)

                Text("Total de questões: \(subject.totalQuestions)")
                Text("Tempo restante: \(subject.remainingTime!) s")
                }
            }                                                        }.listStyle(.sidebar)
        }
      }
    }
}

struct StudyCicleView_Previews: PreviewProvider {
    static var previews: some View {
      StudyCicleView().environmentObject(InputViewModel())
    }
}
