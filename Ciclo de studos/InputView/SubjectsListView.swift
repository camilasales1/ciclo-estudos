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
      Text ("Relação de matérias")
        .font(.title)
        .padding(.top,30)
        .onAppear(){
          inputViewModel.updateStudyCicle()
          
          inputViewModel.updateStudyCicle()
          print(inputViewModel.studyCicle)
        }
      Spacer()
      if inputViewModel.subjects.isEmpty{
        EmptyListView()
      }else{
          List{
            ForEach(inputViewModel.subjects, id:\.self){
            subject in Section(subject.name) {
              
              VStack {
                Text("Nivel de dificuldade:")
                Text(subject.dificult.description)
              }
              HStack {
                Text("Peso:")
                Text(String(format: "%.2f", subject.weight))
              }
              HStack {
                Text("Total de questões previstas:")
                Text("\(subject.totalQuestions)")
              }
              HStack {
                Text("Indice de relevância da matéria: ")
                Text("\(subject.relevance)")
              }
              HStack {
                Text("tempo restante: ")
                 
                Text("\(subject.remainingTime)")
              }
            }
          }
        }
        .listStyle(.sidebar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
          ToolbarItem(placement:.navigationBarTrailing) {
            NavigationLink("Adicionar matérias", value:Screen.subjectregistration).buttonStyle(.bordered)
          }
        }
      }
        Spacer()
      NavigationLink(value: Screen.load){
        Text("Concluir")
          .background(Color.primary)
          .foregroundColor(Color.white)
      }
      .onDisappear() {//atualiza a base de dados.
        dataBase.studyCicle = inputViewModel.studyCicle
        print(dataBase.studyCicle)
      }
      PageIndicator(numPages: 6, currentPage: .constant(5))
    }.onAppear(){
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
