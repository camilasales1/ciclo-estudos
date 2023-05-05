//
//  InputSubjectsView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI

struct SubjectsListView: View {
    
    @EnvironmentObject var inputViewModel : InputViewModel
    
    var body: some View {
        VStack {
            List{ ForEach(inputViewModel.subjects){
                subject in Section(subject.name) {
                    VStack {
                        Text("Nome da matéria:")
                        Text(subject.name)
                    }
                    HStack {
                        Text("Nivel de dificuldade:")
                        Text(subject.dificult.description)
                    }
                    HStack {
                        Text("Peso:")
                        Text(String(format: "%.2f", subject.weight))
                    }
                    HStack {
                        Text("Total de questões previsto:")
                        Text("\(subject.totalQuestions)")
                    }
                }
            }
            }.listStyle(.sidebar)
            NavigationLink("Adicionar matérias", value:Screen.subjectregistration)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement:.navigationBarTrailing) {
                        NavigationLink("Prosseguir", value: Screen.home).buttonStyle(.bordered)
                    }
                }
        }
    }
}

struct SubjectsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SubjectsListView()
                .environmentObject(InputViewModel())
                .environmentObject(NavigationModel())
        }
    }
}
