//
//  Shared.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

enum Weight: Double, CaseIterable{
  case one = 1.0
  case oneAndHalf = 1.5
  case two = 2.0
}
enum Dificulty: Int, Identifiable,CaseIterable{
  case easy = 1
  case regular = 2
  case hard = 3
  var id: Self{self}
}
extension Dificulty: CustomStringConvertible {
  var description: String {
    switch self {
      case .easy:
        return "Pouca"
      case .regular:
        return "Moderada"
      case .hard:
        return "Intensa"
    }
  }
}
