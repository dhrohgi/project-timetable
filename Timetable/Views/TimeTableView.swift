//
//  TimeTableView.swift
//  Timetable
//
//  Created by dennis on 10/19/21.
//

import SwiftUI

struct TimeTableView: View {
    
    @EnvironmentObject var eTimetableModel: ElementaryTimetableModel
    
    var body: some View {
        
        Text("Time Table Here")
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
            .environmentObject(ElementaryTimetableModel())
    }
}
