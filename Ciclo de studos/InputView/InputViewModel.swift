//
//  InputViewModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

class InputViewModel:ObservableObject{
  @Published  var subject:Subject = Subject(name: "", weight: Weight.one.rawValue, dificult: Dificulty.easy.rawValue, totalQuestions: 0)
  let name: String = ""
  @Published  var testDate: Date = Date()
  @Published var studyStartDate: Date = Date()
  @Published  var subjects: [Subject] = [DummyData.fisica,DummyData.portugues]
  @Published var TotalHours:Date?
  @Published  var subjectName:String = ""
  @Published var numberOfQuestions:Int = 0
  @Published  var dificulty = Dificulty.easy
  @Published var weight = Weight.one
  @Published var remainingTime:Int?
  @Published var studyDailyTime:Double = 0.0
  
  func addSubject(subject:Subject){
    
    subjects.append(subject)
    
  }
}
