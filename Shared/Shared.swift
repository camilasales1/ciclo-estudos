//
//  Shared.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

enum Screen{
   case home
   case studyCicle
   case report
   case input
   case detail
}
struct RemainingTime{
   //var tempo = Timer(timeInterval: 60, invocation: <#NSInvocation#>, repeats: false)
}

class NavigationModel: ObservableObject{
   var path: [Screen] = []
   
   func pop(){
      path.removeLast()
   }
   
   func reset(){
      path = [Screen.home]
   }
}
