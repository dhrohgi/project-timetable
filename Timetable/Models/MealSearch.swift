//
//  MealSearch.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

struct MealSearch: Decodable {
    var mealServiceDietInfo: [MealServiceDietInfo]?
    var RESULT: Rst1?
}

struct MealServiceDietInfo: Decodable {
    var head: [Head]?
    var row: [Meal]?
}
