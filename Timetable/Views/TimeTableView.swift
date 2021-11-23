//
//  TimetableView.swift
//  Timetable
//
//  Created by dennis on 10/19/21.
//

import SwiftUI

struct TimetableView: View {
    
    @EnvironmentObject var classModel: ClassModel
    @EnvironmentObject var timetableModel: MisTimeModel
    
    var body: some View {
        
        Text("시간표 입니다")
    }
}

struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        TimetableView()
            .environmentObject(ClassModel())
            .environmentObject(MisTimeModel())
    }
}
