//
//  InputView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

struct TestDateView: View {
    
    @ObservedObject var inputViewModel = InputViewModel()
    
    var body: some View {
        VStack{
            VStack {
                Text("Data da prova")
                DatePicker(
                    "",
                    selection: $inputViewModel.testDate,
                    in: inputViewModel.testDate...,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel).labelsHidden()
            }
            Spacer()
            VStack {
                NavigationLink(value:Screen.daily) {
                    Text("Próximo")
                        .background(Color.primary)
                        .foregroundColor(Color.white) //change to theme color
                }
                PageIndicator(numPages: 5, currentPage: .constant(0))
            }
        }
        .navigationBarTitle("Vamos organizar seus estudos", displayMode: .inline)
        .padding()
    }
}

struct TestDateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TestDateView()
        }
    }
}
