//
//  File.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import Foundation

struct StudyCicle:Identifiable, Hashable {
    var id = UUID()
    let name: String
    var testDate: Date
    var subjects: [Subject]
    var studyDailyTime: Int
    var studyWeekTime:[Int]
    var totalDays:Int
    var totalHours: Int
}

struct Subject: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var weight: Double
    var dificult: Int
    var totalQuestions: Int
    var remainingTime:Double
    var relevance:Double
}

//An image that assists students in time management for entrance exams and competitions. The image should convey the idea of organization, efficiency, and focus on studying. You can use elements such as a stopwatch, a calendar, books, and icons related to different academic subjects to represent the subjects.
