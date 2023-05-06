//
//  DateCalculator.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 01/05/23.
//

import SwiftUI

class DateCalculatorViewModel:  ObservableObject {
    @Published  var startDate = Date()
    @Published  var endDate = Calendar.current.date(from:DateComponents(year:2023, month:11, day:19 ))!
    var difference: Int? = nil
    @Published  var tempototalDeestudo: Int?
    
    func calculateDifference() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        if let days = components.day {
            difference = days
        }
    }
    
    func weekDays() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dataFinal = endDate // data final que desejamos calcular a diferença em relação à data atual
        
        let diasDaSemanaQueContar = [1,2, 3, 4, 5, 6,7] // segunda a sexta-feira (em que 1 é domingo)
        
        var contadorDias = 0 // inicializa o contador de dias
        
        var dataIteracao = Date() // começa a iterar a partir da data atual
        
        while dataIteracao < dataFinal {
            let diaDaSemana = Calendar.current.component(.weekday, from: dataIteracao)
            if diasDaSemanaQueContar.contains(diaDaSemana) {
                contadorDias += 1
            }
            dataIteracao = Calendar.current.date(byAdding: .day, value: 1, to: dataIteracao)!
        }
        tempototalDeestudo = contadorDias
        print("Faltam \(contadorDias) dias até \(dateFormatter.string(from: dataFinal)) contando apenas os dias da semana especificados.")
    }
}

struct DateCalculator: View {
    @ObservedObject var dateCalculatorViewModel = DateCalculatorViewModel()
    
    var body: some View {
        VStack {
            DatePicker("Data Inicial", selection: $dateCalculatorViewModel.startDate, displayedComponents: .date)
            DatePicker("Data Final", selection: $dateCalculatorViewModel.endDate, displayedComponents: .date)
            
            Button(action: {
                dateCalculatorViewModel.weekDays()
            }) {
                Text("Calcular")
            }
            Text("Faltam \(dateCalculatorViewModel.tempototalDeestudo ?? 0) dias até \(dateCalculatorViewModel.endDate)) contando apenas os dias da semana especificados.")
        }
    }
}

struct DateCalculator_Previews: PreviewProvider {
    static var previews: some View {
        DateCalculator()
            .environmentObject(InputViewModel())
    }
}
//pegar a data do final da prova, calcular quantos dias de hoje até lá.
//pegar quantos dias estudará durante a semana
//
