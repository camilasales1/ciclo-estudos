//
//  InputViewModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

class InputViewModel:ObservableObject{
  //Ciclo de estudos a ser utilisado como base.
  @Published var studyCicle = StudyCicle(name: "", testDate: Date(), subjects: [], studyDailyTime: 0, studyWeekTime: [1], totalDays: 0, totalHours: 0)
  
  //Variáveis referente ao ciclo
  @Published var name: String = ""
  @Published var testDate: Date = Calendar.current.date(from: DateComponents( year: 2023, month: 9, day: 23))!
  @Published var studyStartDate: Date = Date()
  @Published var studyDailyTime:Int = 3
  @Published var studyWeekTime:[Int] = [1,2,3,4,5,6,7]
  @Published var totalDays:Int = 0
  var totalHours:Int{
    totalDays * studyDailyTime
  }
  @Published var subjects: [Subject] = []
  
  //Matéria base
  @Published var subject:Subject = Subject(name: "", weight: 1, dificult: 1, totalQuestions: 0,remainingTime: 0,relevance: 0)
  
  //Variáves da matéria
  @Published var subjectName:String = ""
  @Published var numberOfQuestions:Int = 0
  @Published var dificulty = 1
  @Published var weight = 1.0
  
  @Published var relevance:Double = 0
  
  
  
  var percentualRelevance: Double{
    ((relevance*100)/totalRelevance)/100
  }
  var remainingTime:Double{
     percentualRelevance*Double(totalHours)
  }
  //Adiciona uma matéria ao array de matérias do ciclo base
  func addSubject(subject:Subject){
    subjects.append(subject)
  }
  //Atualiza o ciclo base para futura inserção no banco de dados.
  func updateStudyCicle(){
    studyCicle = StudyCicle( name: name, testDate: testDate, subjects: subjects, studyDailyTime: studyDailyTime, studyWeekTime: studyWeekTime, totalDays: totalDays, totalHours: totalHours)
  }
  //Atualiza o total de dias baseado em quantos dias da semana serão estudados.
  func calculateTotalDays (){
    while studyStartDate < testDate {
      let daysOfWeek = Calendar.current.component(.weekday, from: studyStartDate)
      if studyWeekTime.contains(daysOfWeek) {
        totalDays += 1
      }
      studyStartDate = Calendar.current.date(byAdding: .day, value: 1, to: studyStartDate)!
    }
  }
  var totalRelevance: Double{
    subjects.reduce(0, { $0 + $1.relevance })
  }
  func calculateRelevance(numberOfQuestions:Double,dificulty:Int,weight:Double)->() {
     relevance = (Double(numberOfQuestions) * Double(dificulty) * weight)/(Double(numberOfQuestions) + Double(dificulty) + weight)
  }
}

