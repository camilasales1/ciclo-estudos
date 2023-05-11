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
        NavigationLink("Adicionar matérias", value:Screen.subjectregistration)
            .buttonStyle(.bordered)
            .background(Color("blue 1"))
            .foregroundColor(Color("blue 4"))
            .padding()
            .buttonStyle(.borderedProminent)
            .padding()
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmptyListView()
        }
    }
}
