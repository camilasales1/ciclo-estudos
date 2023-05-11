//
//  ResetView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 11/05/23.
//

import SwiftUI

import SwiftUI

struct ResetView: View{
    @EnvironmentObject var navigationModel : NavigationModel
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("blue 4"))
            
            VStack {
                Text("Gostaria de recalcular seu Ciclo de Estudos?")
                    .font(.title).multilineTextAlignment(.center).padding()
                Button("Clique aqui"){
                    navigationModel.path = []
                }
                .padding()
                .background(Color("blue 1"))
                .foregroundColor(Color("blue 4"))
                .clipShape(Capsule())
                .padding()
            }
            .foregroundColor(Color("beige"))
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView()
            .environmentObject(NavigationModel())
    }
}

