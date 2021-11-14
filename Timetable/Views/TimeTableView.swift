//
//  TimeTableView.swift
//  Timetable
//
//  Created by dennis on 10/19/21.
//

import SwiftUI

struct TimeTableView: View {
    
    @EnvironmentObject var eTimetableModel: ElementaryTimetableModel
    
    var layout = [
        GridItem(.flexible(maximum: 40)),
        GridItem(.flexible(maximum: 40)),
        GridItem(.flexible(maximum: 40)),
        GridItem(.flexible(maximum: 40)),
        GridItem(.flexible(maximum: 40)),
        GridItem(.flexible(maximum: 40))
    ]
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: layout, alignment: .center, spacing: 15) {
                
                ForEach(eTimetableModel.elementaryTimetables) { item in
                    Text(item.ITRT_CNTNT)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
            .environmentObject(ElementaryTimetableModel())
    }
}
