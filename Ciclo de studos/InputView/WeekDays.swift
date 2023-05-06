//
//  WeekDays.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 01/05/23.
//

import SwiftUI

struct WeekDays: View {
    @EnvironmentObject var inputViewModel: InputViewModel
    
    var body: some View {
        VStack() {
            Spacer()
            Text("Selecione quantos dias da semana pretende estudar:")
                .font(.title)
                .multilineTextAlignment(.center)
            Picker( selection: $inputViewModel.studyWeekTime, label: Text("Peso da matéria")) {
                ForEach (Week.allCases){ days in
                    Text( String(days.rawValue))
                        .tag(days.value)
                }
            }
            .pickerStyle(.wheel)
            Spacer()
            NavigationLink(value:Screen.subjectlist) {
                Text("Próximo")
                    .background(Color.primary)
                    .foregroundColor(Color.white)
            }
            PageIndicator(numPages: 6, currentPage: .constant(4))
            //change to theme color
        }
    }
}

struct WeekDays_Previews: PreviewProvider {
    static var previews: some View {
        WeekDays().environmentObject(InputViewModel())
    }
}
