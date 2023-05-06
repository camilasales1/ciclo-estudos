//
//  NavigationModel.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import Foundation
class NavigationModel: ObservableObject {
    @Published var path: [Screen] = []
    
    func pop() {
        path.removeLast()
    }
    
    func reset(){
        path = [Screen.home]
    }
}

enum Screen: Hashable{
    case intro
    case startDate
    case endDate
    case daily
    case week
    case subjectlist
    case subjectregistration
    case home
    case studyCicle
    case report
    case input
    case empty
    case load
}

extension Screen: Identifiable{
    var id: Self{ self }
}
