//
//  School.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation

struct SchoolSearch: Decodable {
    var schoolInfo: [SchoolInfo]?
    var RESULT: Rst1?
}

struct Rst1: Decodable {
    var CODE: String?
    var MESSAGE: String?
}

struct SchoolInfo: Decodable {
    var head: [Head]?
    var row: [School]?
}

struct Head: Decodable {
    var list_total_count: Int?
    var RESULT: Rst2?
}

struct Rst2: Decodable {
    var CODE: String?
    var MESSAGE: String?
}
