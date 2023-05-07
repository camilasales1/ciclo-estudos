//
//  DailyStudyTimeView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI

struct DailyStudyTimeView: View {
    @EnvironmentObject var inputViewModel : InputViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Selecione o tempo diário de estudos:")
                .font(.title)
            
            Picker(selection: $inputViewModel.studyDailyTime, label: Text("Peso da matéria")) {
                ForEach (DailyHours.allCases){ hours in
                    Text( "\(hours.rawValue)")
                        .tag(hours.rawValue)
                }
            }
            .pickerStyle(.wheel)
            Spacer()
            NavigationLink(value:Screen.week) {
                Text("Próximo")
                    .padding()
                    .background(Color("Dark blue"))
                    .foregroundColor(Color("Background"))
                    .clipShape(Capsule())
                    .padding()
            }
            PageIndicator(numPages: 6, currentPage: .constant(3))
        }
        .background(Color("Background"))
    }
}

struct DailyStudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyStudyTimeView().environmentObject(InputViewModel())
    }
}
