//
//  DummyData.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

struct DummyData{
   
  static var subjects:[Subject] = [informatica,portugues,matematica,fisica]
  static var informatica:Subject = Subject(name: "Informática", weight: Weight.two.rawValue, dificult: Dificulty.easy.rawValue, totalQuestions: 20,remainingTime:1800)
  static var portugues:Subject = Subject(name: "Português", weight: Weight.oneAndHalf.rawValue, dificult: Dificulty.regular.rawValue, totalQuestions: 20,remainingTime:21600)
  static var matematica:Subject = Subject(name: "Matemática", weight: Weight.one.rawValue, dificult:Dificulty.regular.rawValue, totalQuestions: 20,remainingTime:1600)
  static var fisica:Subject = Subject(name: "Física", weight: Weight.one.rawValue, dificult: Dificulty.easy.rawValue, totalQuestions: 20,remainingTime:30000)
}
