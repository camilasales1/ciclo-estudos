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
            VStack {
                StudyCicleView()
            }
            .tabItem {
                Image(systemName: "clock.arrow.circlepath")
            }
            .tint(Color("beige"))
            
          ResetView()
            .tabItem {
              Image(systemName:"note.text")
              Text("Novo Ciclo")
            }
        }
        .tint(Color("beige"))
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
            .environmentObject(DataBase())
            .environmentObject(NavigationModel())
        }
    }
}
