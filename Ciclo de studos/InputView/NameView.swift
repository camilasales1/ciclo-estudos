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
                .foregroundColor(Color("beige"))
            TextField("Insira aqui o nome", text: $inputViewModel.name)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                .padding()
            Spacer()
            NavigationLink( value: Screen.startDate){
                Text("Próximo")
                    .padding()
                    .background(Color("blue 1"))
                    .foregroundColor(Color("blue 4"))
                    .clipShape(Capsule())
                    .padding()
            }
            PageIndicator(numPages: 6, currentPage: .constant(1))
        }
        .background(Color("blue 4"))
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
