//
//  InputViewModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

class InputViewModel:ObservableObject {
    //MARK: Dummys:
    @Published var subject:Subject = Subject(name: "",
                                             weight: 1.5,
                                             dificult: 1,
                                             totalQuestions: 10,
                                             subjectTotalStudyTime: 0,
                                             relevance: 32, remainingTime: 0)
    @Published var subjects: [Subject] = []
    @Published var studyCicle = StudyCicle(name: "",
                                           testDate: Date(),
                                           subjects: [],
                                           studyDailyTime: 0,
                                           studyWeekTime: [1],
                                           totalDays: 0,
                                           totalHours: 12,
                                           remainingTotalHours: 12 )
    
    //----------------------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: Variáveis referente ao ciclo
    @Published var name: String = ""
    @Published var testDate: Date = Calendar.current.date(from: DateComponents( year: 2023, month: 6, day: 23))!
    @Published var studyStartDate: Date = Date()
    @Published var studyDailyTime: Int = 3
    @Published var studyWeekTime: [Int] = [1,2,3,4,5,6,7]
    @Published var totalDays: Int = 0
    var totalHours:Int {
        totalDays * studyDailyTime
    }
    var remainingTotalHours:Double{
    return Double(totalHours)
    }
    
    //MARK: Variáves da matéria
    @Published var subjectName:String = ""
    @Published var numberOfQuestions:Int = 0
    @Published var dificulty = 1
    @Published var weight = 1.0
    @Published var subjectTotalStudyTime = 0.0
    @Published var remainingTime: Double = 0.0
    var relevance: Double {
        ((Double(numberOfQuestions) * Double(dificulty) * weight))/((Double(numberOfQuestions) + Double(dificulty) + weight))
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: calculando o total de dias baseado em quantos dias na semana serão estudados.
    func calculateTotalDays() {
        while studyStartDate < testDate {
            let daysOfWeek = Calendar.current.component(.weekday, from: studyStartDate)
            if studyWeekTime.contains(daysOfWeek) {
                totalDays += 1
            }
            studyStartDate = Calendar.current.date(byAdding: .day, value: 1, to: studyStartDate)!
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: Calculando o tempo de cada matéria:
    var totalRelevance: Double {
        subjects.reduce(0, { $0 + $1.relevance })
    }
    
    var percentualRelevance: Double {
        ((relevance*100)/totalRelevance)/100
    }
    
    func updateRemainingTime() {
        for i in 0..<subjects.count {
            let percentualRelevance = subjects[i].relevance/totalRelevance
            subjects[i].subjectTotalStudyTime = percentualRelevance * Double(totalHours)
            subjects[i].remainingTime = percentualRelevance * Double(totalHours)
        }
    }
    
    //----------------------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: Adiciona uma matéria ao array de matérias do ciclo base
    func addSubject(subject:Subject) {
        subjects.append(subject)
    }
    
    //MARK: Atualiza o ciclo base para futura inserção no banco de dados.
    func updateStudyCicle() {
        studyCicle = StudyCicle( name: name,
                                 testDate: testDate,
                                 subjects: subjects,
                                 studyDailyTime: studyDailyTime,
                                 studyWeekTime: studyWeekTime,
                                 totalDays: totalDays,
                                 totalHours: totalHours,
                                 remainingTotalHours: remainingTotalHours)
    }
  func clear(){
    subjectName = ""
    numberOfQuestions = 0
    dificulty = 1
    weight = 1.0
    subjectTotalStudyTime = 0.0
    remainingTime = 0.0
    name = ""
    testDate = Calendar.current.date(from: DateComponents( year: 2023, month: 6, day: 23))!
    studyStartDate  = Date()
    studyDailyTime = 3
    studyWeekTime = [1,2,3,4,5,6,7]
    totalDays = 0
  }
}
