//
//  diasporsemana.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 01/05/23.
//

import SwiftUI

struct Dias {
    let dataFinal = Calendar.current.date(from:DateComponents(year:2023, month:11, day:19 ))! // substitua com a data final desejada
    var tempoTotalEstudo = Date()
    var diasPorSemana = 5 // substitua com o número desejado de dias por semana de estudo
    var diasPorSemanaTimeInterval = 1
    var semanasDeEstudo = 1
    // mutating func dataFinal1(){
    //    tempoTotalEstudo = dataFinal.timeIntervalSince(Date())}
    //  mutating  func diasPorsemana1(){
    //    diasPorSemana = TimeInterval(7 * diasPorSemana)
    //  }
    //  mutating func semanasDeEstudo1(){
    //  semanasDeEstudo = Int(tempoTotalEstudo / diasPorSemanaTimeInterval)
}

struct diasporsemana: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct diasporsemana_Previews: PreviewProvider {
    static var previews: some View {
        diasporsemana()
    }
}
