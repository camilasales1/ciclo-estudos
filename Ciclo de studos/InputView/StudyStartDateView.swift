//
//  InputView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI




struct TestDateView: View {
    
  @EnvironmentObject var inputViewModel : InputViewModel
    
    var body: some View {
      
       
            VStack{
                
                            VStack {
                    
                  Text("Vamos organizar seus estudos?")
                    .font(.title)
                    .padding()
                  Text("Selecione Data da prova ou a data limite para os estudos.")
                    .font(.title2)
                    DatePicker(
                      "", selection: $inputViewModel.testDate, in: Date()...,  displayedComponents: [.date]
                    ).datePickerStyle(.wheel)
                  Text(inputViewModel.testDate.formattedDateBR)
                }
                Spacer()
                VStack {
                  NavigationLink(value:Screen.daily) {
                        Text("Próximo")
                            .background(Color.primary)
                            .foregroundColor(Color.white) //change to theme color
                    }
                    PageIndicator(numPages: 6, currentPage: .constant(2))
                }
            }
            .padding()
    }
}

struct TestDateView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationStack {
        TestDateView()
          .environmentObject(InputViewModel())
      }
    }
}
