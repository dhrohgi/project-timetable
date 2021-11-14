//
//  SchoolInfoModel.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation
import SwiftUI

class SchoolInfoModel: ObservableObject {
    
    @Published var schools = [School]()
        
    init() {
        getSchoolInfo()
    }
    
    func getSchoolInfo() {
        
          // let urlString = "https://open.neis.go.kr/hub/schoolInfo?KEY=2349feb6b7134d43831f415416e58d88&Type=json&pIndex=1&pSize=10&ATPT_OFCDC_SC_CODE=C10"
          // let url = URL(string: urlString)
        
        var urlComponents = URLComponents(string: "https://open.neis.go.kr/hub/schoolInfo")
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: "2349feb6b7134d43831f415416e58d88"),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: "1"),
            URLQueryItem(name: "pSize", value: "10"),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: "C10"),
            URLQueryItem(name: "SD_SCHUL_CODE", value: "7211240")
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            // request.httpMethod = "GET"
            // request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            // request.addValue("2349feb6b7134d43831f415416e58d88", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                guard let data = data else {
                    return
                }
                                
                do {
                    //let jsonData = try JSONSerialization.jsonObject(with: data!)
                    
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SchoolSearch.self, from: data)
                    print(result)
                    
                    for schs in result.schoolInfo {
                        for sch in schs.row {
                            sch.id = UUID()
                        }
                        self.schools += schs.row
                    }
                    
                }
                catch {
                    print(error)
                }
                
            }
            
            dataTask.resume()
        }
    }    
}
