//
//  MealView.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import SwiftUI

struct MealView: View {
    
    @EnvironmentObject var mealModel: MealModel
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
            .environmentObject(MealModel())
    }
}
