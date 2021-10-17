//
//  ElementaryTimetableModel.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import Foundation

class ElementaryTimetableModel: ObservableObject {
    
    @Published var elementaryTimetables = [ElementaryTimetable]()
    
    init() {
        
        self.elementaryTimetables = getLocalData()
        
    }
    
    func getLocalData() -> [ElementaryTimetable] {
        
        let jsonUrl = Bundle.main.url(forResource: "일광초등학교시간표", withExtension: "json")
        
        guard jsonUrl != nil else {
            return [ElementaryTimetable]()
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let timetables = try jsonDecoder.decode([ElementaryTimetable].self, from: jsonData)
            
            for timetable in timetables {
                timetable.id = UUID()
            }
            
            return timetables
            
        }
        catch {
            print(error)
        }
        
        return [ElementaryTimetable]()
        
    }
    
}
