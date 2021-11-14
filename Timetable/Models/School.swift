//
//  School.swift
//  Timetable
//
//  Created by dennis on 11/7/21.
//

import Foundation

class School: Decodable, Identifiable {
    
    var id: UUID?
    var ATPT_OFCDC_SC_CODE: String?
    var ATPT_OFCDC_SC_NM: String?
    var SD_SCHUL_CODE: String?
    var SCHUL_NM: String?
    var ENG_SCHUL_NM: String?
    var SCHUL_KND_SC_NM: String?
    var LCTN_SC_NM: String?
    var JU_ORG_NM: String?
    var FOND_SC_NM: String?
    var ORG_RDNZC: String?
    var ORG_RDNMA: String?
    var ORG_RDNDA: String?
    var ORG_TELNO: String?
    var HMPG_ADRES: String?
    var COEDU_SC_NM: String?
    var ORG_FAXNO: String?
    var HS_SC_NM: String?
    var INDST_SPECL_CCCCL_EXST_YN: String?
    var HS_GNRL_BUSNS_SC_NM: String?
    var SPCLY_PURPS_HS_ORD_NM: String?
    var ENE_BFE_SEHF_SC_NM: String?
    var DGHT_SC_NM: String?
    var FOND_YMD: String?
    var FOAS_MEMRD: String?
    var LOAD_DTM: String?
    
}
