//
//  SchoolTabView.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import SwiftUI

struct SchoolTabView: View {
    
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "building.2")
                        Text("학교")
                    }
                }
            
            TimetableView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.split.3x3")
                        Text("시간표")
                    }
                }
            
            MealView()
                .tabItem {
                    VStack {
                        Image(systemName: "fork.knife")
                        Text("급식정보")
                    }
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolTabView()
    }
}
