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
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("blue 4"))
            VStack {
                Spacer()
                HStack{
                    Text("P")
                        .foregroundColor(Color("beige"))
                    Text("l")
                        .foregroundColor(Color("beige"))
                    Text("a")
                        .foregroundColor(Color("blue 1"))
                    Text("n")
                        .foregroundColor(Color("blue 2"))
                    Text("o")
                        .foregroundColor(Color("blue 3"))
                }
                .font(.custom("MontserratAlt1-Regular", size: 100))
                .fontWeight(.bold)
                .foregroundColor(Color("Dark blue"))
                .padding()
                
                Text("Responda algumas perguntas e tenha um cronograma personalizado de estudos.")
                    .foregroundColor(Color("beige"))
                    .font(.title2)
                    .fontWeight(.thin)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
                NavigationLink( value: Screen.name) {
                    Text("Vamos começar")
                        .padding()
                        .background(Color("blue 1"))
                        .foregroundColor(Color("blue 4"))
                        .clipShape(Capsule())
                        .padding()
                }
                .onAppear(){
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
            .background(Color("blue 4"))
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
