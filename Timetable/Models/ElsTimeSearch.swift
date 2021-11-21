//
//  ElsTimeSearch.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

struct ElsTimeSearch: Decodable {
    var elsTimetable: [ElsTimetable]?
    var RESULT: Rst1?
}

struct ElsTimetable: Decodable {
    var head: [Head]?
    var row: [ElsTime]?
}
