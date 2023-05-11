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
        VStack {
            Spacer()
            Text("Selecione a data da prova:")
                .font(.title)
            DatePicker(
                "", selection: $inputViewModel.testDate, in: Date()...,  displayedComponents: [.date]
            )
            .colorInvert()
            .datePickerStyle(.wheel)
            .padding()
            
            //                Text(inputViewModel.testDate.formattedDateBR)
            Spacer()
            VStack {
                NavigationLink(value:Screen.daily) {
                    Text("Próximo")
                        .padding()
                        .background(Color("blue 1"))
                        .foregroundColor(Color("blue 4"))
                        .clipShape(Capsule())
                        .padding()
                }
                PageIndicator(numPages: 6, currentPage: .constant(2))
            }
        }
        .foregroundColor(Color("beige"))
        .background(Color("blue 4"))
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
