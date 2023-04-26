//
//  Ciclo_de_studosApp.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import SwiftUI

@main
struct Ciclo_de_studosApp: App {
   @StateObject var navigationModel = NavigationModel()
    var body: some Scene {
        WindowGroup {
           NavigationStack(path: $navigationModel.path){
           HomeView()
              .environmentObject(NavigationModel())
              .navigationDestination(for: Screen.self){
                 
                 screen in switch screen{
                 case .home:
                    HomeView()
                 case .studyCicle:
                    StudyCicleView()
                 case .detail:
                    DetailView()
                 case .report:
                    ReportView()
                 case .input:
                    InputView()
                 }
              }
           }
        }
    }
}
