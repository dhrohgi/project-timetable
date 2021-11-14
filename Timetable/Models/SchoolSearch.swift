//
//  School.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation

struct SchoolSearch: Decodable {
    var schoolInfo = [SchoolInfo]()
}

struct SchoolInfo: Decodable {
    var head = [Head]()
    var row = [School]()
}

struct Head: Decodable {
    var list_total_count = 1
    var RESULT = Result()
}

struct Result: Decodable {
    var CODE = ""
    var MESSAGE = ""
}


