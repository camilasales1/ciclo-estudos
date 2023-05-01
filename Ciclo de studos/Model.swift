//
//  File.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import Foundation

struct StudyCicle:Identifiable, Hashable{
    var id = UUID()
    let name: String
    var testDate: Date
    var subjects: [Subject]
    var TotalHours:Int
    var StudyDailyTime: Double
}

struct Subject: Identifiable,Hashable{
    var id = UUID()
    var name: String
    var weight: Double
    var dificult: Int
    var totalQuestions: Int
    var remainingTime:Int?
}
