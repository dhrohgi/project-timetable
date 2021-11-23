//
//  MealView.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import SwiftUI

struct MealView: View {
    
    @EnvironmentObject var mealModel: MealModel    
    var schoolCode: String = ""
       
    var body: some View {
        
        Text("급식정보 입니다")
        
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
            .environmentObject(MealModel())
    }
}
