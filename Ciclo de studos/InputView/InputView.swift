//
//  InputView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI

struct InputView: View {
    
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Vamos organizar seus estudos")
                    .font(.title2)
                    .padding(.top)
                Spacer()
                VStack {
                    Text("Data da prova")
                    DatePicker(
                        "", selection: $date, in: date...,  displayedComponents: [.date]
                    ).datePickerStyle(.wheel).labelsHidden()
                }
                Spacer()
                VStack {
                    NavigationLink(destination: HomeView()) {
                        Text("Próximo")
                            .background(Color.primary)
                            .foregroundColor(Color.white) //change to theme color
                    }
                    PageIndicator(numPages: 5, currentPage: .constant(0))
                }
            }
            .padding()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
