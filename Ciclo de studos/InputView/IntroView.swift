//
//  IntroView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI

struct IntroView: View {
  @EnvironmentObject var navigationModel : NavigationModel
    var body: some View {
      //Essa é a primeira tela do app, Dará uma introdução ao propósito do app.
      VStack {
        Spacer()
        Text("Introdução")
          .multilineTextAlignment(.center)
          .font(.title)
          .padding()
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ")
          .multilineTextAlignment(.leading)
          .padding()
        Spacer()
        NavigationLink( value: Screen.report){
          Text("Próximo")
            .background(Color.primary)
            .foregroundColor(Color.white) //change to theme color
        }.onAppear(){
          print(navigationModel.path)
          DispatchQueue.main.asyncAfter(deadline: .now()+3){
            navigationModel.path.append(Screen.empty)
            
            print(navigationModel.path)
          }
        }
//        Button("mudar navegação"){
//          navigationModel.path = [Screen.load]
//        }
        PageIndicator(numPages: 6, currentPage: .constant(0))
      // usamos agora o valor do enum Screen para navegar por todo o app.
      }
    }
  
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        IntroView().environmentObject(NavigationModel())
      }
    }
}
