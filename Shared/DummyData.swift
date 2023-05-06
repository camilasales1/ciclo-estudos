//
//  DummyData.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

struct DummyData{
    static var studyCicle = StudyCicle(name: "Meu Ciclo de Estudos",
                                       testDate: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 19)) ?? Date(),
                                       subjects: subjects,
                                       studyDailyTime: 3,
                                       studyWeekTime: [1,2,3,4,5],
                                       totalDays: 0,
                                       totalHours: 90)
    
    static var subjects:[Subject] = [informatica,portugues]
    
    static var informatica:Subject = Subject(name: "Informática",
                                             weight: Weight.two.rawValue,
                                             dificult: Dificulty.easy.rawValue,
                                             totalQuestions: 20,
                                             remainingTime: 0,
                                             relevance: 0)
    
    static var portugues:Subject = Subject(name: "Português",
                                           weight: Weight.oneAndHalf.rawValue,
                                           dificult: Dificulty.regular.rawValue,
                                           totalQuestions: 20,
                                           remainingTime: 0,
                                           relevance: 0)
    
    static var matematica:Subject = Subject(name: "Matemática",
                                            weight: Weight.one.rawValue,
                                            dificult:Dificulty.regular.rawValue,
                                            totalQuestions: 20,
                                            remainingTime: 0,
                                            relevance: 0)
    
    static var fisica:Subject = Subject(name: "Física",
                                        weight: Weight.one.rawValue,
                                        dificult: Dificulty.easy.rawValue,
                                        totalQuestions: 20,
                                        remainingTime: 0,
                                        relevance: 0)
    
}
