//
//  SchoolModel.swift
//  Timetable
//
//  Created by dennis on 10/18/21.
//

import Foundation
import SwiftUI

class SchoolModel: ObservableObject {
    
    @Published var schools = [School]()
     
    init() {
        getSchool("7211240")
        getSchool("7211243")
        getSchool("7211242")
    }
    
    func getSchool(_ schoolCode: String) {
        
        let schoolCode: String = "7211240"
        
        // let urlString = "https://open.neis.go.kr/hub/schoolInfo?KEY=2349feb6b7134d43831f415416e58d88&Type=json&pIndex=1&pSize=10&ATPT_OFCDC_SC_CODE=C10"
        // let url = URL(string: urlString)
        
        var urlComponents = URLComponents(string: "https://open.neis.go.kr/hub/schoolInfo")
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: "2349feb6b7134d43831f415416e58d88"),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: "1"),
            URLQueryItem(name: "pSize", value: "300"),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: "C10"),
            URLQueryItem(name: "SD_SCHUL_CODE", value: schoolCode)
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            // request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            // request.addValue("2349feb6b7134d43831f415416e58d88", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                guard let data = data else {
                    return
                }
                
                //                let dataAsString = String(data: data, encoding: .utf8)
                //                print(dataAsString)
                //
                //                do {
                //                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                //                    print(json)
                //                }
                //                catch let jsonErr {
                //                    print("Error serializing json: ", jsonErr)
                //                }
                
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SchoolSearch.self, from: data)
                    
                    if let schoolInfo = result.schoolInfo {
                        for schoolInfo in schoolInfo {
                            
                            if let schools = schoolInfo.row {
                                for school in schools {
                                    school.id = UUID()
                                    
                                }
                                DispatchQueue.main.async {
                                    self.schools += schools
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
}
