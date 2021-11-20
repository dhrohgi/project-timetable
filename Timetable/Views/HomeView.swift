//
//  HomeView.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var schoolModel: SchoolModel
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("시간표를 보시려면 학교를 선택하세요")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack(spacing: 20) {
                        
                        if let schools = schoolModel.schools {
                            
                            ForEach(schools) { school in
                                
                                NavigationLink {
                                    TimeTableView()
                                } label: {
                                    HomeViewRow(
                                        image: school.SCHUL_NM,
                                        school: school.SCHUL_NM,
                                        description: school.JU_ORG_NM ?? "",
                                        zipCode: school.ORG_RDNZC ?? "",
                                        phone: school.ORG_TELNO ?? "",
                                        address: school.ORG_RDNMA ?? "",
                                        homePage: school.HMPG_ADRES ?? "")
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
            .environmentObject(SchoolModel())
    }
}
