//
//  MisTimeSearch.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

struct MisTimeSearch: Decodable {
    var misTimetable: [MisTimetable]?
    var RESULT: Rst1?
}

struct MisTimetable: Decodable {
    var head: [Head]?
    var row: [MisTime]?
}
