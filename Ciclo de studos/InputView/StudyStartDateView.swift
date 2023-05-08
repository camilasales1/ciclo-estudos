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
            .datePickerStyle(.wheel)
            .padding()
            
            //                Text(inputViewModel.testDate.formattedDateBR)
            Spacer()
            VStack {
                NavigationLink(value:Screen.daily) {
                    Text("Próximo")
                        .padding()
                        .background(Color("Dark blue"))
                        .foregroundColor(Color("Background"))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                        .padding()
                }
                PageIndicator(numPages: 6, currentPage: .constant(2))
            }
        }
        .background(Color("Background"))
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
