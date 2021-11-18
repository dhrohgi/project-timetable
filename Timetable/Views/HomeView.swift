//
//  HomeView.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var schoolInfoModel: SchoolInfoModel
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("시간표를 보시려면 학교를 선택하세요")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack(spacing: 20) {
                        
                        if schoolInfoModel.schools.count > 0 {
                            
                            if let schools = schoolInfoModel.schools {
                                
                                ForEach(0..<schools.count) { index in
                                    
                                    let school = schools[index]
                                    
                                    NavigationLink {
                                        TimeTableView()
                                    } label: {
                                        HomeViewRow(
                                            image: school.SCHUL_NM!,
                                            school: school.SCHUL_NM!,
                                            description: school.JU_ORG_NM!,
                                            zipCode: school.ORG_RDNZC!,
                                            phone: school.ORG_TELNO!,
                                            address: school.ORG_RDNMA!)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("일광 신도시 학교정보")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SchoolInfoModel())
    }
}
