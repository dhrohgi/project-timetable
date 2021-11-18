//
//  School.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation

struct SchoolSearch: Codable {
    var schoolInfo: [SchoolInfo]?
    var RESULT: Rst1?
}

struct Rst1: Codable {
    var CODE: String?
    var MESSAGE: String?
}

struct SchoolInfo: Codable {
    var head: [Head]?
    var row: [School]?
}

struct Head: Codable {
    var list_total_count: Int?
    var RESULT: Rst2?
}

struct Rst2: Codable {
    var CODE: String?
    var MESSAGE: String?
}
