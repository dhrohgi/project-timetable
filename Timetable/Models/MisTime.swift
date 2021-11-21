//
//  MisTime.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import Foundation

class MisTime: Decodable, Identifiable {
    
    var id: UUID?
    var ATPT_OFCDC_SC_CODE: String?
    var ATPT_OFCDC_SC_NM: String?
    var SD_SCHUL_CODE: String?
    var SCHUL_NM: String?
    var AY: String?
    var SEM: String?
    var DGHT_CRSE_SC_NM: String?
    var ALL_TI_YMD: String?
    var GRADE: String?
    var CLASS_NM: String?
    var PERIO: String?
    var ITRT_CNTNT: String?
    var LOAD_DTM: String?
    
}
