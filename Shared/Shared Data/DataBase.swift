//
//  DataBase.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import Foundation

class DataBase:ObservableObject{
  @Published var studyCicle:StudyCicle = 
  StudyCicle(name: "", testDate: Date(), subjects: [], studyDailyTime: 0, studyWeekTime: [1], totalDays: 0, totalHours: 0)
}
