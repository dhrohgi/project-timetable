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
        getClass("7211240")
        getClass("7211243")
        getClass("7211242")
    }
    
    func getClass(_ schoolCode: String) {
        
        var urlComponents = URLComponents(string: "https://open.neis.go.kr/hub/classInfo")
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: "f468427a1c1b4faea6e3b3626c2b53ad"),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: "1"),
            URLQueryItem(name: "pSize", value: "10"),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: "C10"),
            URLQueryItem(name: "SD_SCHUL_CODE", value: schoolCode),
            URLQueryItem(name: "AY", value: "2021")
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
