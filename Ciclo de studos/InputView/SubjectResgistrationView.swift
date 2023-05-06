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
        Form(){
            Text("Adicione uma matéria ao ciclo de estudos")
                .multilineTextAlignment(.center)
                .font(.title)
            VStack (alignment:.listRowSeparatorLeading){
                Text("Insira o nome da matéria:")
                TextField("Nome da Matéria", text: $inputViewModel.subjectName)
            }.onAppear()
            VStack (alignment:.listRowSeparatorLeading){
                Text("Quantas questões dessa matéria terá?")
                TextField("Insira o número de questões",
                          value: $inputViewModel.numberOfQuestions,
                          format: .number).keyboardType(.numberPad)
            }
            
            VStack(alignment:.listRowSeparatorLeading) {
                Text("Selecione o peso da matéria de acordo com o edital:")
                    .multilineTextAlignment(.center)
                Picker( selection: $inputViewModel.weight, label: Text("Peso da matéria")) {
                    ForEach (Weight.allCases, id: \.self){ weight in
                        Text(String(format: "%.2f", weight.rawValue))
                            .tag(weight.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            VStack {
                Text("Selecione seu grau de Dificuldade com a matéria:")
                Picker(selection: $inputViewModel.dificulty, label: Text("Dificuldade")) {
                    ForEach(Dificulty.allCases, id: \.self) { dificuldade in
                        Text(dificuldade.description).tag(dificuldade.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .buttonStyle(.bordered)
                .padding()
                Text("Relevancia da matéria: "  + String(inputViewModel.subject.relevance))
                    .multilineTextAlignment(.leading)
                    .padding()
                Button("Adicionar Matéria"){
                    inputViewModel.addSubject(subject: Subject(name: inputViewModel.subjectName,
                                                               weight: inputViewModel.weight,
                                                               dificult: inputViewModel.dificulty,
                                                               totalQuestions: inputViewModel.numberOfQuestions,
                                                               remainingTime: inputViewModel.remainingTime,
                                                               relevance: inputViewModel.relevance))
                    navigationModel.path.removeLast()
                }
            }
        }
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
