//
//  StudyCicleView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
struct StudyCicleViewModel {
    
    var studyCicle:StudyCicle = DummyData.studyCicle
    
    
}

struct StudyCicleView: View {
    @EnvironmentObject var dataBase : DataBase
    @State var studyCicleViewModel = StudyCicleViewModel()
    var body: some View {
     //MARK: Cabeçalho
        Group {
            VStack {
                Text(studyCicleViewModel.studyCicle.name)
                Text("Dias para prova: \(studyCicleViewModel.studyCicle.testDate.daysToDate)")
                Text("Dias por Semana: \(studyCicleViewModel.studyCicle.studyWeekTime.count )")
                Text("Tempo para estudo diário: " + String(studyCicleViewModel.studyCicle.studyDailyTime ))
                Text("Total de horas de estudo: \(studyCicleViewModel.studyCicle.totalHours )")
    //MARK: MATÉRIAS
                ScrollView{
                    ForEach(studyCicleViewModel.studyCicle.subjects, id:\.self){
                      subject in VStack(alignment: .leading){
                          Text("\(subject.name)")
                          ProgressRing(totalTime: subject.subjectTotalStudyTime*3600, remainingTime: subject.remainingTime*3600)
                           
                            Text("Peso: " + String(format: "%.2f", subject.weight))
                            Text("Dificuldade com a matéria: " + subject.dificult.description)
                            Text("Total de questões: \(subject.totalQuestions)")
                          Text("Tempo restante: \(subject.subjectTotalStudyTime.formatted()) s")
                        }
                    }
                }.padding()
             
            }
        }
        .onAppear(){
            studyCicleViewModel.studyCicle = dataBase.studyCicle
            print(studyCicleViewModel.studyCicle.name)
        }
    }
}

struct StudyCicleView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        StudyCicleView().environmentObject(DataBase())
      }
    }
}
