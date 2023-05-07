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
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [Color("Dark blue"), Color("Background")]),
                                    center: .center,
                                    startAngle: .zero,
                                    endAngle: .degrees(360)),
                    lineWidth: 40
                )
                .frame(width: 150, height: 150)
                .padding()
            Text("Study Path")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("Dark blue"))
                .padding()
            Text("Uma ferramenta projetada para auxiliar estudantes na gestão eficiente do tempo durante a preparação para vestibulares e concursos.Responda apenas algumas perguntas e tenha um cronograma personalizado de estudos.")
                .font(.title2)
                .fontWeight(.thin)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
            NavigationLink( value: Screen.report) {
                Text("Próximo")
                    .padding()
                    .background(Color("Dark blue"))
                    .foregroundColor(Color("Background"))
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
        .background(Color("Background"))
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IntroView().environmentObject(NavigationModel())
        }
    }
}
