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
        VStack (alignment:.listRowSeparatorLeading){
          Text("Insira o nome da matéria:")
          TextField("Nome da Matéria", text: $inputViewModel.subjectName)
        }.onAppear()
        VStack (alignment:.listRowSeparatorLeading){
          Text("Quantas questões dessa matéria terá?")
          TextField("Insira o número de questões", value: $inputViewModel.numberOfQuestions, format: .number).keyboardType(.numberPad)
        }
        
        VStack(alignment:.listRowSeparatorLeading) {
          Text("Selecione o peso da matéria de acordo com o edital:").multilineTextAlignment(.center)
          Picker( selection: $inputViewModel.weight, label: Text("Peso da matéria")) {
            ForEach (Weight.allCases, id: \.self){ weight in
              Text(String(format: "%.2f", weight.rawValue))
                .tag(weight)
            }
          }
          .pickerStyle(.segmented)
        }
        VStack {
          Text("Selecione seu grau de Dificuldade com a matéria:")
          Picker(selection: $inputViewModel.dificulty, label: Text("Dificuldade")) {
            ForEach(Dificulty.allCases, id: \.self) { dificuldade in
              Text(dificuldade.description).tag(dificuldade)
            }
          }
          .pickerStyle(.segmented)
          Button("Adicionar Matéria"){
            inputViewModel.addSubject(subject: Subject(name: inputViewModel.subjectName, weight: inputViewModel.weight.rawValue, dificult: inputViewModel.dificulty.rawValue, totalQuestions: inputViewModel.numberOfQuestions))
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
