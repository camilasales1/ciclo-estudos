//
//  InputViewModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

class InputViewModel:ObservableObject{
//Dummys:
  @Published var subject:Subject = Subject(name: "", weight: 1.5, dificult: 1, totalQuestions: 10,remainingTime: 0,relevance: 32)
  @Published var subjects: [Subject] = []
  @Published var studyCicle = StudyCicle(name: "", testDate: Date(), subjects: [], studyDailyTime: 0, studyWeekTime: [1], totalDays: 0, totalHours: 0)
//----------------------------------------------------------------------------------------------------------------------------------------------
//Variáveis referente ao ciclo
  @Published var name: String = ""
  @Published var testDate: Date = Calendar.current.date(from: DateComponents( year: 2023, month: 9, day: 23))!
  @Published var studyStartDate: Date = Date()
  @Published var studyDailyTime:Int = 3
  @Published var studyWeekTime:[Int] = [1,2,3,4,5,6,7]
  @Published var totalDays:Int = 0
  var totalHours:Int{ totalDays * studyDailyTime }
//Variáves da matéria
  @Published var subjectName:String = ""
  @Published var numberOfQuestions:Int = 0
  @Published var dificulty = 1
  @Published var weight = 1.0
  var relevance: Double {((Double(numberOfQuestions) * Double(dificulty) * weight))/((Double(numberOfQuestions) + Double(dificulty) + weight))}
  @Published var remainingTime: Double = 0.0
//---------------------------------------------------------------------------------------------------------------------------------------------
//calculando o total de dias baseado em quantos dias na semana serão estudados.
  func calculateTotalDays (){
    while studyStartDate < testDate {
      let daysOfWeek = Calendar.current.component(.weekday, from: studyStartDate)
      if studyWeekTime.contains(daysOfWeek) {
        totalDays += 1
      }
      studyStartDate = Calendar.current.date(byAdding: .day, value: 1, to: studyStartDate)!
    }
  }
//---------------------------------------------------------------------------------------------------------------------------------------------
  //Calculando o tempo de cada matéria:
  var totalRelevance: Double{
    subjects.reduce(0, { $0 + $1.relevance })
  }
  var percentualRelevance: Double{
    ((relevance*100)/totalRelevance)/100
  }
  func updateRemainingTime(){
    for i in 0..<subjects.count {
      let percentualRelevance = subjects[i].relevance/totalRelevance
      subjects[i].remainingTime = percentualRelevance * Double(totalHours)
    }
  }
//----------------------------------------------------------------------------------------------------------------------------------------------
//Adiciona uma matéria ao array de matérias do ciclo base
  
  func addSubject(subject:Subject){
    subjects.append(subject)
  }
//Atualiza o ciclo base para futura inserção no banco de dados.
  func updateStudyCicle(){
    studyCicle = StudyCicle( name: name, testDate: testDate, subjects: subjects, studyDailyTime: studyDailyTime, studyWeekTime: studyWeekTime, totalDays: totalDays, totalHours: totalHours)
  }
}
