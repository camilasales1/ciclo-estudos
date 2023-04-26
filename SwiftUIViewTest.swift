//
//  SwiftUIViewTest.swift
//  Ciclo de studos
//
//  Created by Camila Sales on 24/04/23.
//

import SwiftUI

struct SwiftUIViewTest: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("circle")
                }
        }
    }
}

struct SwiftUIViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewTest()
    }
}
