//
//  DetailView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
struct DetailViewModel{
  
}
struct DetailView: View {
  var subject:Subject
    var body: some View {
      List {
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
          //Text(String(format: "%.2f", subject.weight))
        }
        HStack {
          Text("Total de questões previsto:")
          Text("\(subject.totalQuestions)")
        }
     //   Text(subject.remainingTime)
        
      }
      .navigationTitle(subject.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        DetailView(subject: DummyData.informatica)
      }
    }
}
