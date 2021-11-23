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
            SchoolTabView()
                .environmentObject(SchoolModel())
                .environmentObject(ClassModel())
                .environmentObject(MisTimeModel())
                .environmentObject(MealModel())
        }
    }
}
