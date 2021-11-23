//
//  MealModel.swift
//  Timetable
//
//  Created by dennis on 11/21/21.
//

import Foundation
import SwiftUI

class MealModel: ObservableObject {
    
    @Published var meals = [Meal]()
    
    func getMeal(_ schoolCode: String) {
        
        var urlComponents = URLComponents(string: "https://open.neis.go.kr/hub/mealServiceDietInfo")
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: "e31b83f2952d4efda484ad8b4c134b11"),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: "1"),
            URLQueryItem(name: "pSize", value: "10"),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: "C10"),
            URLQueryItem(name: "SD_SCHUL_CODE", value: schoolCode),
            URLQueryItem(name: "MLSV_YMD", value: "20211122")
        ]
        
        let url = urlComponents?.url
        
        guard let url = url else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MealSearch.self, from: data)
                
                if let dietInfo = result.mealServiceDietInfo {
                    for dietInfo in dietInfo {
                        
                        if let meals = dietInfo.row {
                            for meal in meals {
                                meal.id = UUID()
                            }
                            DispatchQueue.main.async {
                                self.meals += meals
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
