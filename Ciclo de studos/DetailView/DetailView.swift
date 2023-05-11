//
//  DetailView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 10/05/23.
//

import SwiftUI

struct DetailView: View {
 @State var subject:Subject
 @State var studyCicleViewModel = StudyCicleViewModel()
  
    var body: some View {
      Text("")
      List {
        Ring(totalTime: subject.subjectTotalStudyTime, remainingTime: subject.remainingTime, elapsedTime: subject.subjectTotalStudyTime-subject.remainingTime, percentage: (subject.subjectTotalStudyTime-subject.remainingTime)/subject.subjectTotalStudyTime)
        //MARK: outras informações
        Text("Peso: " + String(format: "%.2f", subject.weight))
        Text("Dificuldade com a matéria: " + subject.dificult.description)
        Text("Total de questões: \(subject.totalQuestions)")
        Text("Tempo Sugerido de Estudo: " + String(format: "%02d:%02d:%02d",
                    //horas
                                                   Int(subject.subjectTotalStudyTime*3600)/3600,
                    //minutos
                                                   Int((subject.subjectTotalStudyTime*3600/60).truncatingRemainder(dividingBy: 60)),
                    //segundos
                                                   Int((subject.subjectTotalStudyTime*3600).truncatingRemainder(dividingBy: 60).truncatingRemainder(dividingBy: 60))
                   )
        )
      }
      .font(.title2)
      .listStyle(.grouped)
        .navigationTitle(subject.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        DetailView(subject: DummyData.matematica)
          .environmentObject(DataBase())
      }
    }
}
