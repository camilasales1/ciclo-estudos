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
class DataView: ObservableObject{
  let timeInterval: Double = 24*60*60 // valor Double em segundos desde 01/01/1970
  var dateFormatter = DateFormatter()
 
  var dateString = ""
  var date1 = Date()
    init(){
      dateFormatter.dateFormat = " HH:mm:ss"
     dateString = dateFormatter.string(from: Date(timeIntervalSince1970: timeInterval))
      date1 = dateFormatter.date(from: dateString)!
        // aqui a variável "date" é um Date com as informações de horas corretas
      
    }
}
struct diasporsemana: View {
  @ObservedObject var vm = DataView()
    var body: some View {
      Text(vm.date1.formatted(date: .omitted, time: .complete))
    }
}

struct diasporsemana_Previews: PreviewProvider {
    static var previews: some View {
        diasporsemana()
    }
}
