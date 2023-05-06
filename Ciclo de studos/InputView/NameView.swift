//
//  ReportView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var inputViewModel : InputViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Vamos começar dando um nome para Seu novo Ciclo de estudos:")
                .multilineTextAlignment(.center)
                .font(.title)
            TextField("Insira aqui o nome", text: $inputViewModel.name).multilineTextAlignment(.center)
            Spacer()
            NavigationLink( value: Screen.startDate){
                Text("Próximo")
                    .background(Color.primary)
                    .foregroundColor(Color.white) //change to theme color
            }
            PageIndicator(numPages: 6, currentPage: .constant(1))
        }
    }
}

struct NameView_previews: PreviewProvider {
    static var previews: some View {
        NameView()
            .environmentObject(NavigationModel())
            .environmentObject(InputViewModel())
            .environmentObject(DataBase())
    }
}
