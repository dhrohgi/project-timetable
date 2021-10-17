//
//  HomeView.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var eleTimetableModel: ElementaryTimetableModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(eleTimetableModel.elementaryTimetables) { t in
                    Text(t.ITRT_CNTNT)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ElementaryTimetableModel())
    }
}
