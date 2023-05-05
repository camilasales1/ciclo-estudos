//
//  File.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import Foundation

struct StudyCicle:Identifiable{
   var id = UUID()
   let name: String
   var testDate: Date
   var studyStartDate: Date
   var subjects: [Subject]
   var TotalHours:Date?
}

struct Subject: Identifiable{
   var id = UUID()
   var name: String
   var weight: Int
   var dificult: Int
   var totalQuestions: Int
   var remainingTime:Date?
}
