//
//  ElsTimeModel.swift
//  Timetable
//
//  Created by dennis on 11/22/21.
//

import Foundation
import SwiftUI

class ElsTimeModel: ObservableObject {
    
    @Published var elsTimes = [ElsTime]()
    
    
    func getElsTime(_ schoolCode: String) {
        
        var urlComponents = URLComponents(string: Constants.apiUrlElsTime)
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: Constants.apiKey2),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: Constants.pageIndex),
            URLQueryItem(name: "pSize", value: Constants.pageSize),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: Constants.educationOfficeKey),
            URLQueryItem(name: "SD_SCHUL_CODE", value: schoolCode),
            URLQueryItem(name: "AY", value: Constants.schoolYear)
        ]
        
        let url = urlComponents?.url
        
        guard let url = url else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ElsTimeSearch.self, from: data)
                
                if let elsTimetable = result.elsTimetable {
                    for elsTimetable in elsTimetable {
                        
                        if let timetables = elsTimetable.row {
                            for t in timetables {
                                t.id = UUID()
                            }
                            DispatchQueue.main.async {
                                self.elsTimes += timetables
                            }
                        }
                    }
                }
                
            }
            catch {
                print(error)
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
