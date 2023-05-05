//
//  BarChartsView.swift
//  BarCharts
//
//  Created by Erik Loures on 03/05/23.
//

import SwiftUI

//struct BarChartsView: View {
//    var body: some View {
//
//        Home()
//    }
//}
//
//struct BarChartsView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarChartsView()
//    }
//}

struct Home: View {
    
    @State var selected = 0
    var colors = [Color("Color1"),Color("Color2")]//gradient
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)//colunas do gráfico
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
          
            VStack {
           
                // Bar Chart...
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Daily Workout in Hrs")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    HStack(spacing: 15) {
                        ForEach(workout_Data) {work in
                            
                            // Bars...
                            
                            VStack {
                                
                                VStack {
                                    
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id {
                                        Text(getHrs(value: work.study_In_Mn))
                                            .foregroundColor(Color("Color1"))
                                            .padding(.bottom,5)
                                    }
                                    
                                    RoundeShape()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                    // max height = 200
                                        .frame(height: getHeight(value: work.study_In_Mn))
                                }
                                .frame(height: 220)
                                .onTapGesture {
                                    
                                    withAnimation(.easeOut) {
                                        
                                        selected = work.id
                                    }
                                }
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(10)
                .padding()
                
                HStack {
                    Text("Statistics")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)

                }
                .padding()
                
                // stats Grid
                
                LazyVGrid(columns: columns,spacing: 30) {
                    
                    ForEach(stats_Data){ stat in //linha 251
                        
                        VStack(spacing: 32) {
                            
                            HStack {
                                Text(stat.title)
                                    .font(.system(size:22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Spacer(minLength: 0)
                            }
                            
                            // Rings...
                            
                            ZStack {
                                
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(stat.color.opacity(0.20), lineWidth: 10)
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                    
                                Circle()
                                    .trim(from: 0, to: (stat.currentData / stat.goal))
                                    .stroke(stat.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                
                                Text(getPercent(current: stat.currentData, Goal: stat.goal) + " %" )
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(stat.color)
                                    .rotationEffect(.init(degrees: 90))
                                
                            }
                            .rotationEffect(.init(degrees: -90))
                            
//                            Text(getDec(val: stat.currentData) + getType(val: stat.title))
//
//                                .font(.system(size: 22))
//                                .foregroundColor(.white)
//                                .fontWidth(.bold)
                        }
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(15)
                        .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 0)
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        //  fundo escuro
        .preferredColorScheme(.dark)
        // status bar color is not changing
        // its still in beta...
    }
    
    // calculating Type...
    
    func getType(val: String)->String {
        
        switch val { // fazer deacordo com o nome da matéria colocada pelo usuário.
        case "Portugues": return "Hrs"
        case "Matematica": return "Hrs"
        case "Quimica": return "Hrs"
        case "Fisica": return "Hrs"
        case "informatica": return "Hrs"
        case "Direito": return "Hrs"
        default: return "Hrs"
        }
    }
    
    //  converting Number to decimal ...
    
    func getDec(val: CGFloat)->String {
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        return format.string(from: NSNumber.init(value: Float(val)))!
        
    }
    
    // calculating percent...
    
    func getPercent(current: CGFloat, Goal: CGFloat)->String {
        
        let per = (current / Goal) * 100
        
        return String(format: "%.1f", per)
        
    }
    
    // calculating Hrs For Height
    
    func getHeight(value: CGFloat)->CGFloat {
        
        // the value in minutes..
        
        // 24 hrs in min = 1440
        
        let hrs = CGFloat(value / 1440) * 200
            
        return hrs
    }
    // getting hrs...
    
    func getHrs(value: CGFloat)->String {
        
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
    
}

struct RoundeShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        
        return Path(path.cgPath)
    }
}

// sample Data...

struct Daily: Identifiable {
    var id: Int
    var day: String
    var study_In_Mn: CGFloat
}
    var workout_Data = [// day seria o subject, study in seria o remaining time
    
        Daily(id: 0, day: "Day 1", study_In_Mn: 480),
        Daily(id: 1, day: "Day 2", study_In_Mn: 880),
        Daily(id: 2, day: "Day 3", study_In_Mn: 250),
        Daily(id: 3, day: "Day 4", study_In_Mn: 360),
        Daily(id: 4, day: "Day 5", study_In_Mn: 1220),
        Daily(id: 5, day: "Day 6", study_In_Mn: 750),
        Daily(id: 6, day: "Day 7", study_In_Mn: 950)
    
    ]


// stats Data...

struct Stats : Identifiable { // adaptar esses Dados dentro dos dados do Subject
    var id: Int
    var title: String
    var currentData: CGFloat
    var goal: CGFloat
    var color: Color

}

var stats_Data = [ //[subjects] title: subjects.name, currentData seria remaningTime goal totalremainingTime, color seria por posição no array.

    Stats(id: 0, title: "Portugues", currentData: 6.8, goal: 15, color: Color("Portugues")),
    Stats(id: 1, title: "Matematica", currentData: 3.5, goal: 5, color: Color("Matematica")),
    Stats(id: 2, title: "Quimica", currentData: 6.8, goal: 15, color: Color("Quimica")),
    Stats(id: 3, title: "Fisica", currentData: 58, goal: 100, color: Color("Fisica")),
    Stats(id: 4, title: "Informatica", currentData: 6.8, goal: 10, color: Color("Informatica")),
    Stats(id: 5, title: "Direito ", currentData: 12.5, goal: 25, color: Color("Direito"))

]
