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
        
        
        VStack{
          Spacer()
          Text("Selecione o tempo diário para estudos:").font(.title)
            .padding(-40)
            Picker( selection: $inputViewModel.studyDailyTime, label: Text("Peso da matéria")) {
              ForEach (DailyHours.allCases){ hours in
                Text( "\(hours.rawValue)")
                  .tag(hours.rawValue)
              }
            }.padding(-20)
            .pickerStyle(.wheel)
          Spacer()
            NavigationLink(value:Screen.week) {
              Text("Próximo")
                .background(Color.primary)
                .foregroundColor(Color.white) //change to theme color
            }
          
            PageIndicator(numPages: 6, currentPage: .constant(3))
          }
        
        
        .padding()
      }
}

struct DailyStudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
      DailyStudyTimeView().environmentObject(InputViewModel())
    }
}
