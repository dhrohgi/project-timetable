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
                        
                        ForEach(1..<schoolInfoModel.schoolInfos.count) { index in
                            
                            let schoolInfo = schoolInfoModel.schoolInfos[index]
                            
                            NavigationLink {
                                TimeTableView()
                            } label: {
                                HomeViewRow(
                                    image: schoolInfo.SCHUL_NM,
                                    school: schoolInfo.SCHUL_NM,
                                    description: schoolInfo.JU_ORG_NM,
                                    zipCode: schoolInfo.ORG_RDNZC,
                                    phone: schoolInfo.ORG_TELNO,
                                    address: schoolInfo.ORG_RDNMA)
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
