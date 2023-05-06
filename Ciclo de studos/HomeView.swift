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
            Text("dois")
                .tabItem {
                    Image(systemName: "square.and.pencil.circle.fill")
                    Text("dois")
                }
            Home()
                .tabItem {
                    Image(systemName: "chart.fill")
                    Text("dois")
                }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView().environmentObject(DataBase())
        }
    }
}
