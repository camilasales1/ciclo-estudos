//
//  DataBase.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import Foundation

class DataBase:ObservableObject{
  @Published var studyCicle:StudyCicle
  init(studyCicle: StudyCicle) {
    self.studyCicle = studyCicle
  }
}
