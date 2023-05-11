//
//  StudyCicleView.swift
//  Ciclo de studos
//
//  Created by Roberto Mascarenhas on 21/04/23.
//

import SwiftUI
struct StudyCicleViewModel {
    
    var studyCicle:StudyCicle = DummyData.studyCicle
    var totalHours: Double{
        Double(studyCicle.totalHours)
    }
    var remainingTime: Double{ studyCicle.subjects.reduce(0, { $0 + $1.remainingTime })}
    var percentage: Double {
        remainingTime/totalHours
    }
}

struct StudyCicleView: View {
    //cor do texto do navigationTile
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("beige"))]
        
    }
    
    @EnvironmentObject var dataBase : DataBase
    @State var studyCicleViewModel = StudyCicleViewModel()
    
    var body: some View {
        //MARK: Cabeçalho
        VStack {
            ScrollView {
                VStack(alignment:.leading){
                    Ring(totalTime: Double(studyCicleViewModel.totalHours),
                         remainingTime: studyCicleViewModel
                        .remainingTime,
                         elapsedTime: studyCicleViewModel
                        .totalHours-studyCicleViewModel
                        .remainingTime,
                         percentage: studyCicleViewModel
                        .percentage)
                }
                .padding()
                
                Group {
                    VStack {
                        HStack {
                            Text("Dias para prova:")
                            Spacer()
                            Text(String(studyCicleViewModel.studyCicle.testDate.daysToDate))
                        }
                        HStack {
                            Text("Dias por semana:")
                            Spacer()
                            Text(String(studyCicleViewModel.studyCicle.studyWeekTime.count))
                        }
                        HStack {
                            Text("Tempo de estudo diário:")
                            Spacer()
                            Text(String(studyCicleViewModel.studyCicle.studyDailyTime))
                        }
                        HStack {
                            Text("Total de horas total:")
                            Spacer()
                            Text(String(studyCicleViewModel.studyCicle.totalHours))
                        }
//                        HStack {
//                            Text("Quantidades de matérias:")
//                            Spacer()
//                            Text(String(studyCicleViewModel.studyCicle.subjects.count))
//                        }
                        HStack {
                            Text("Total de questões:")
                            Spacer()
                            Text(String(studyCicleViewModel.studyCicle.subjects.reduce(0, { $0 + $1.totalQuestions })))
                        }
                    }
                }
                .padding()
                .background(Color("blue 2").opacity(0.1))
                
                //MARK: MATÉRIAS
                ForEach(studyCicleViewModel.studyCicle.subjects, id:\.self){
                    subject in VStack(alignment: .leading){
                        Text("\(subject.name)").font(.title)
                        //MARK: Ciclo
                        ProgressRing(totalTime: subject.subjectTotalStudyTime*3600, remainingTime: subject.remainingTime*3600)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(studyCicleViewModel.studyCicle.name)
        .foregroundColor(Color("beige"))
        .onAppear(){
            studyCicleViewModel.studyCicle = dataBase.studyCicle
            print(studyCicleViewModel.studyCicle.name)
        }
        .padding()
        .background(Color("blue 4"))
    }
}

struct StudyCicleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StudyCicleView()
                .environmentObject(DataBase())
            
        }
    }
}
