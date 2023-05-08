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
            Picker(selection: $inputViewModel.studyWeekTime, label: Text("Peso da matéria")) {
                ForEach (Week.allCases){ days in
                    Text( String(days.rawValue))
                        .tag(days.value)
                }
            }
            .pickerStyle(.wheel)
            Spacer()
            NavigationLink(value:Screen.subjectlist) {
                Text("Próximo")
                    .padding()
                    .background(Color("Dark blue"))
                    .foregroundColor(Color("Background"))
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    .padding()
            }
            PageIndicator(numPages: 6, currentPage: .constant(4))
        }
        .background(Color("Background"))
    }
}

struct WeekDays_Previews: PreviewProvider {
    static var previews: some View {
        WeekDays().environmentObject(InputViewModel())
    }
}
