//
//  SchoolInfoModel.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation

class SchoolInfoModel: ObservableObject {
    
    @Published var schoolInfos = [SchoolInfo]()
    
    init() {
        
        self.schoolInfos = getLocalData()
        
    }
    
    func getLocalData() -> [SchoolInfo] {
        
        let jsonUrl = Bundle.main.url(forResource: "schoolInfo", withExtension: "json")
        
        guard jsonUrl != nil else {
            return [SchoolInfo]()
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let schoolInfos = try jsonDecoder.decode([SchoolInfo].self, from: jsonData)
            
            for schoolInfo in schoolInfos {
                schoolInfo.id = UUID()
            }
            
            return schoolInfos
            
        }
        catch {
            print(error)
        }
        
        return [SchoolInfo]()
        
    }
    
}
