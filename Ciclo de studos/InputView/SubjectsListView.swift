//
//  InputSubjectsView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI

struct SubjectsListView: View {
    @EnvironmentObject var inputViewModel : InputViewModel
    @EnvironmentObject var dataBase: DataBase
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                if inputViewModel.subjects.isEmpty {
                    EmptyListView()
                } else {
                    VStack {
                        List(inputViewModel.subjects, id:\.self) { subject in
                            Text(subject.name)
                        }
                        .scrollContentBackground(.hidden)
                        Spacer()
                        NavigationLink("Adicionar matérias", value:Screen.subjectregistration)
                            .buttonStyle(.bordered)
                            .padding()
                            .background(Color("Dark blue"))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
                Spacer()
            }
//            .navigationTitle("Adicione uma matéria")
            .onAppear(){
                inputViewModel.updateStudyCicle()
                inputViewModel.updateStudyCicle()
                print(inputViewModel.studyCicle)
            }
            NavigationLink(value: Screen.load) {
                Text("Concluir")
                    .padding()
                    .background(Color("Dark blue"))
                    .foregroundColor(Color("Background"))
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    .padding()
            }
            .onDisappear() {//atualiza a base de dados.
                dataBase.studyCicle = inputViewModel.studyCicle
                print(dataBase.studyCicle)
            }
            PageIndicator(numPages: 6, currentPage: .constant(5))
        }
//        .background(Color("Background"))
        .onAppear(){
            inputViewModel.calculateTotalDays()
            inputViewModel.updateRemainingTime()
        }
    }
}

struct SubjectsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SubjectsListView()
                .environmentObject(InputViewModel())
                .environmentObject(NavigationModel())
                .environmentObject(DataBase())
        }
    }
}
