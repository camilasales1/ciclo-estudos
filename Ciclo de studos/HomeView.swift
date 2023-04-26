//
//  ContentView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       
       TabView {
//          VStack{
             Text("um")
//             NavigationLink("study Cicle View", value:Screen.studyCicle)
//          }
          .tabItem {
             Image(systemName: "clock.fill")
             Text("dois")
          }
//          VStack{
             Text("tres")
//             NavigationLink("Home", value:Screen.home)
//          }
//          .tabItem {
//             Image(systemName: "clock.fill")
//          }
       }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       NavigationStack {
          HomeView()
       }
    }
}
