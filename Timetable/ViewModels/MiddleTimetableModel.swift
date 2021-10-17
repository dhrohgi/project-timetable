//
//  MiddleTimetableModel.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import Foundation

class MiddleTimetableModel: ObservableObject {
    
    @Published var middleTimetables = [MiddleTimetable]()
    
    init() {
        
        self.middleTimetables = getLocalData()
        
    }
    
    func getLocalData() -> [MiddleTimetable] {
        
        let jsonUrl = Bundle.main.url(forResource: "일광중학교시간표", withExtension: "json")
        
        guard jsonUrl != nil else {
            return [MiddleTimetable]()
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let timetables = try jsonDecoder.decode([MiddleTimetable].self, from: jsonData)
            
            for timetable in timetables {
                timetable.id = UUID()
            }
            
            return timetables
            
        }
        catch {
            print(error)
        }
        
        return [MiddleTimetable]()
        
    }
    
}
