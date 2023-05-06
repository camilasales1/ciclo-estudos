//
//  DetailView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
struct DetailViewModel{
    
}
struct EmptyListView: View {
    
    var body: some View {
        Text("Insira uma matéria ao seu Ciclo de Estudos")
            .font(.title).multilineTextAlignment(.center)
        NavigationLink("Adicionar matérias", value:Screen.subjectregistration)
            .buttonStyle(.bordered)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmptyListView()
        }
    }
}
