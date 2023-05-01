//
//  NavigationModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import Foundation
class NavigationModel: ObservableObject{
  var path: [Screen] = []
  
  func pop(){
    path.removeLast()
  }
  
  func reset(){
    path = [Screen.home]
  }
}
enum Screen{
  case intro
  case startDate
  case endDate
  case daily
  case subjectlist
  case subjectregistration
  case home
  case studyCicle
  case report
  case input
  case detail(Subject)
}
extension Screen: Identifiable,Hashable{
  var id: Self{ self }
}
