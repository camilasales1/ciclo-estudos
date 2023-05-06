//
//  Ciclo_de_studosApp.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 19/04/23.
//

import SwiftUI

@main
struct Ciclo_de_studosApp: App {
    // instanciamos a classe para poder funcionar nas views abaixo.
    @StateObject var navigationModel = NavigationModel()
    @StateObject var inputViewModel = InputViewModel()
    @StateObject var dataBase = DataBase()
    
    var body: some Scene {
        WindowGroup {
            //Navigation Stack está na raiz do app, dessa forma não é necessário declará-la novamente dentro das views, todas já estão envoltas pelo navigationStack.
            NavigationStack(path: $navigationModel.path){
                //path é um array que lista o caminho percorrido pelas stacks a cada nova tela uma stack é adicionada nesse array com seu endereço
                
                IntroView()
                //Essa será a primeira view a ser vista no app.
                    .environmentObject(NavigationModel())
                // ao usarmos o environment object Todas as views terão acesso a essa Classe e estarão atentas a mudanças nela.
                    .navigationDestination(for: Screen.self){
                        // o navigation Destination está usando um enum que é um hashable sem tipo específico por isso dá para dar vários destinos de view com um enum só juntanto com o switch esse Enum é uma boa para poder usar apenas uma navigation Destination sem ter problemas e conseguir navegar por todo app.
                        screen in switch screen{
                        case .intro:
                            IntroView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .home:
                            HomeView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .studyCicle:
                            StudyCicleView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .empty:
                            EmptyListView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .report:
                            NameView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .input:
                            TestDateView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .startDate:
                            TestDateView().environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                                .environmentObject(dataBase)
                        case .endDate:
                            TestDateView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .daily:
                            DailyStudyTimeView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .subjectlist:
                            SubjectsListView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .subjectregistration:
                            SubjectResgistrationView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .week:
                            WeekDays()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        case .load:
                            LoadView()
                                .environmentObject(inputViewModel)
                                .environmentObject(navigationModel)
                                .environmentObject(dataBase)
                        }
                    }
            }
        }
    }
}
