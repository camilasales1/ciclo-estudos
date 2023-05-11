//
//  SubjectView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI


struct SubjectResgistrationView: View {
    @EnvironmentObject var inputViewModel: InputViewModel
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        
        VStack {
            Form() {
                Section(header: Text("Nome")){
                    TextField("Nome da matéria", text: $inputViewModel.subjectName)
                }
                .onAppear()
                
                Section(header: Text("Número de questões"), footer: Text("Digite o número de questões da matéria.")){
                    TextField("", value: $inputViewModel.numberOfQuestions,
                              format: .number)
                    .keyboardType(.numberPad)
                }
                
                Section(header: Text("Peso"),
                        footer: Text("Selecione o peso da matéria de acordo com o edital.")) {
                    Picker(selection: $inputViewModel.weight,
                           label: Text("Peso da matéria")) {
                        ForEach (Weight.allCases, id: \.self){ weight in
                            Text(String(format: "%.2f", weight.rawValue))
                                .tag(weight.rawValue)
                        }
                    }
                           .pickerStyle(.segmented)
                }
                
                Section(header: Text("Dificuldade"), footer: Text("Selecione o grau de dificuldade da matéria.")) {
                    Picker(selection: $inputViewModel.dificulty,
                           label: Text("Dificuldade")) {
                        ForEach(Dificulty.allCases, id: \.self) { dificuldade in
                            Text(dificuldade.description).tag(dificuldade.rawValue)
                        }
                    }
                           .pickerStyle(.segmented)
                           .buttonStyle(.bordered)
                }
                
                //            VStack(alignment:.listRowSeparatorLeading) {
                //                Text("Relevancia da matéria: "  + String(inputViewModel.subject.relevance))
                //                    .multilineTextAlignment(.leading)
                //            }
                
            }
            .navigationTitle("Adicione uma matéria")
            .scrollContentBackground(.hidden)
            
            Button("Adicionar"){
                inputViewModel.addSubject(subject: Subject(name: inputViewModel.subjectName,
                                                           weight: inputViewModel.weight,
                                                           dificult: inputViewModel.dificulty,
                                                           totalQuestions: inputViewModel.numberOfQuestions,
                                                           subjectTotalStudyTime: inputViewModel.subjectTotalStudyTime,
                                                           relevance: inputViewModel.relevance, remainingTime: inputViewModel.remainingTime))
                navigationModel.path.removeLast()
            }
            .padding()
            .background(Color("Dark blue"))
            .foregroundColor(Color("Background"))
            .clipShape(Capsule())
            .shadow(radius: 5)
            .padding()
        }
        .background(Color("Background"))
    }
}

struct SubjectRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SubjectResgistrationView()
                .environmentObject(InputViewModel())
                .environmentObject(NavigationModel())
        }
    }
}
