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
            Text("Dê um nome para o ciclo de estudos:")
                .multilineTextAlignment(.center)
                .font(.title)
            TextField("Insira aqui o nome", text: $inputViewModel.name)
                .multilineTextAlignment(.center)
            Spacer()
            NavigationLink( value: Screen.startDate){
                Text("Próximo")
                    .padding()
                    .background(Color("Dark blue"))
                    .foregroundColor(Color("Background"))
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    .padding()
            }
            PageIndicator(numPages: 6, currentPage: .constant(1))
        }
        .background(Color("Background"))
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
