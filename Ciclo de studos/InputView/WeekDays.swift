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
                .foregroundColor(Color("beige"))
                .multilineTextAlignment(.center)
            Picker(selection: $inputViewModel.studyWeekTime, label: Text("Peso da matéria")) {
                ForEach (Week.allCases){ days in
                    Text( String(days.rawValue))
                        .tag(days.value)
                }
            }
            .pickerStyle(.wheel)
            .colorInvert()
            
            Spacer()
            NavigationLink(value:Screen.subjectlist) {
                Text("Próximo")
                    .padding()
                    .background(Color("blue 1"))
                    .foregroundColor(Color("blue 4"))
                    .clipShape(Capsule())
                    .padding()
            }
            PageIndicator(numPages: 6, currentPage: .constant(4))
        }
        .background(Color("blue 4"))
    }
}

struct WeekDays_Previews: PreviewProvider {
    static var previews: some View {
        WeekDays().environmentObject(InputViewModel())
    }
}
