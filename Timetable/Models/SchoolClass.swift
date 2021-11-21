//
//  SchoolClass.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

class SchoolClass: Decodable, Identifiable {
    
    var id: UUID?
    var ATPT_OFCDC_SC_CODE: String?
    var ATPT_OFCDC_SC_NM: String?
    var SD_SCHUL_CODE: String?
    var SCHUL_NM: String?
    var AY: String?
    var GRADE: String?
    var DGHT_CRSE_SC_NM: String?
    var SCHUL_CRSE_SC_NM: String?
    var ORD_SC_NM: String?
    var DDDEP_NM: String?
    var CLASS_NM: String?
    var LOAD_DTM: String?
    
}
