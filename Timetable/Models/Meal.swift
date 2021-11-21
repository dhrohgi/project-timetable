//
//  Meal.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation

class Meal: Decodable, Identifiable {
    
    var id: UUID?
    var ATPT_OFCDC_SC_CODE: String?
    var ATPT_OFCDC_SC_NM: String?
    var SD_SCHUL_CODE: String?
    var SCHUL_NM: String?
    var MMEAL_SC_CODE: String?
    var MMEAL_SC_NM: String?
    var MLSV_YMD: String?
    var MLSV_FGR: String?
    var DDISH_NM: String?
    var ORPLC_INFO: String?
    var CAL_INFO: String?
    var NTR_INFO: String?
    var MLSV_FROM_YMD: String?
    var MLSV_TO_YMD: String?
    
}
