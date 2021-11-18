//
//  TimetableApp.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import SwiftUI

@main
struct TimetableApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(SchoolInfoModel())
                .environmentObject(ElementaryTimetableModel())
                .environmentObject(MiddleTimetableModel())
        }
    }
}
