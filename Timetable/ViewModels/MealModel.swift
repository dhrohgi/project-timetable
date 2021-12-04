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
        
        var urlComponents = URLComponents(string: Constants.apiUrlMeal)
        urlComponents?.queryItems = [
            URLQueryItem(name: "KEY", value: Constants.apiKey3),
            URLQueryItem(name: "Type", value: "json"),
            URLQueryItem(name: "pIndex", value: Constants.pageIndex),
            URLQueryItem(name: "pSize", value: Constants.pageSize),
            URLQueryItem(name: "ATPT_OFCDC_SC_CODE", value: Constants.educationOfficeKey),
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
