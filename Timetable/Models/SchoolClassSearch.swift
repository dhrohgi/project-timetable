//
//  SchoolClassSearch.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

struct SchoolClassSearch: Decodable {
    var classInfo: [SchoolClassInfo]?
    var RESULT: Rst1?
}

struct SchoolClassInfo: Decodable {
    var head: [Head]?
    var row: [SchoolClass]?
}
