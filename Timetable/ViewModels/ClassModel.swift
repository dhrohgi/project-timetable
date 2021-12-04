//
//  ClassModel.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation
import SwiftUI

class ClassModel:ObservableObject {
    
    @Published var schoolClasses = [SchoolClass]()
    
    init() {
        getClass(Constants.ilgwangElsKey)
        getClass(Constants.habitElsKey)
        getClass(Constants.ilgwangMisKey)
    }
    
    func getClass(_ schoolCode: String) {
        
        var urlComponents = URLComponents(string: Constants.apiUrlClass)
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: Constants.apiKey1),
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
                let result = try decoder.decode(SchoolClassSearch.self, from: data)
                
                if let classInfo = result.classInfo {
                    for classInfo in classInfo {
                        
                        if let classes = classInfo.row {
                            for c in classes {
                                c.id = UUID()
                            }
                            DispatchQueue.main.async {
                                self.schoolClasses += classes
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
