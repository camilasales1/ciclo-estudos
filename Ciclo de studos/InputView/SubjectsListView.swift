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
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("blue 4"))
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
                                .background(Color("blue 1"))
                                .foregroundColor(Color("blue 4"))
                                .padding()
                                .buttonStyle(.borderedProminent)
                                .padding()
                                
                        }
                    }
                    
                    Spacer()
                }
                .onAppear(){
                    inputViewModel.updateStudyCicle()
                    inputViewModel.updateStudyCicle()
                    print(inputViewModel.studyCicle)
                }
                NavigationLink(value: Screen.load) {
                    Text("Concluir")
                        .padding()
                        .background(Color("blue 1"))
                        .foregroundColor(Color("blue 4"))
                        .clipShape(Capsule())
                        .padding()
                }
                .onDisappear() {//atualiza a base de dados.
                    dataBase.studyCicle = inputViewModel.studyCicle
                    print(dataBase.studyCicle)
                }
                PageIndicator(numPages: 6, currentPage: .constant(5))
            }
            .onAppear() {
                inputViewModel.calculateTotalDays()
                inputViewModel.updateRemainingTime()
            }
        .background(Color("blue 4"))
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
