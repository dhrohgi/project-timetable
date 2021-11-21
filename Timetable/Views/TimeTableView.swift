//
//  TimetableView.swift
//  Timetable
//
//  Created by dennis on 10/19/21.
//

import SwiftUI

struct TimetableView: View {
    
    @EnvironmentObject var TimetableModel: TimetableModel
    
    var body: some View {
        
        Text("Time Table Here")
    }
}

struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        TimetableView()
            .environmentObject(TimetableModel())
    }
}
