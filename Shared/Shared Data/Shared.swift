//
//  Shared.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import Foundation

enum Weight: Double, CaseIterable{
    case one = 1.0
    case oneAndHalf = 1.5
    case two = 2.0
}
enum Dificulty: Int, Identifiable,CaseIterable{
    case easy = 1
    case regular = 2
    case hard = 3
    var id: Self{self}
}
extension Dificulty: CustomStringConvertible {
    var description: String {
        switch self {
        case .easy:
            return "Pouca"
        case .regular:
            return "Moderada"
        case .hard:
            return "Intensa"
        }
    }
}

enum Week: Int,Identifiable,CaseIterable{
    var id: Self{self}
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
}

extension Week{
    var value:[Int]{
        switch self{
        case .one:
            return [1]
        case .two:
            return [1,2]
        case .three:
            return [1,2,3]
        case .four:
            return [1,2,3,4]
        case .five:
            return [1,2,3,4,5]
        case .six:
            return [1,2,3,4,5,6]
        case .seven:
            return [1,2,3,4,5,6,7]
        }
    }
}

enum DailyHours: Int,Identifiable,CaseIterable{
    case one = 1
    case two = 2
    case three = 3
    case four =  4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case eleven = 11
    case twelve = 12
    case thirteen = 13
    case fourteen = 14
    case fifthteen = 15
    case sixteen = 16
    var id: Self{self}
}

extension Date{
    var formattedDateBR: String{
        self.formatted(
            .dateTime
                .day(.twoDigits)
                .month(.wide)
                .year(.defaultDigits))
    }
}

extension Date{
    var daysToDate: Int{ Calendar.current.dateComponents([.day], from: Date(), to: self).day!}
}
