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
                        
                        ForEach(schoolInfoModel.schoolInfos) { s in
                            
                            HomeViewRow(
                                image: s.SCHUL_NM,
                                school: s.SCHUL_NM,
                                description: s.JU_ORG_NM,
                                zipCode: s.ORG_RDNZC,
                                phone: s.ORG_TELNO,
                                address: s.ORG_RDNMA)
                            
                        }
                    }
                    .padding()
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
