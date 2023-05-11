//
//  LoadView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 03/05/23.
//

import SwiftUI

struct LoadView: View {
    @EnvironmentObject var navigationModel : NavigationModel
    var valor:Float = 5
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("blue 4"))
            
            ProgressView() {
                Text("Calculando as Variáveis do Ciclo de Estudos")
            }
            .colorInvert()
            .onAppear() {
                print(navigationModel.path)
                DispatchQueue.main.asyncAfter(deadline: .now()+3){
                    navigationModel.path.append(Screen.home)
                    print(navigationModel.path)
                }
            }
        }
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoadView()
                .environmentObject(DataBase())
                .environmentObject(NavigationModel())
                .environmentObject(InputViewModel())
        }
    }
}
