//
//  DailyStudyTimeView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 25/04/23.
//

import SwiftUI

struct DailyStudyTimeView: View {
    
    @ObservedObject var inputViewModel = InputViewModel()
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text("Quantas Horas você gostaria de estudar por dia?")
                TextField("Tempo diário para Estudos", value:$inputViewModel.studyDailyTime, format: .number).keyboardType(.numberPad).padding()
            }
            Spacer()
            VStack {
                NavigationLink(value:Screen.subjectlist) {
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

struct DailyStudyTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyStudyTimeView()
    }
}
