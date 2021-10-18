//
//  HomeViewRow.swift
//  Timetable
//
//  Created by dennis on 10/17/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var school: String
    var description: String
    var zipCode: String
    var phone: String
    var address: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(school)
                        .bold()
                        .font(.title3)
                    Text(description)
                        .font(.caption)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "mail")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(zipCode)
                            .font(.caption)
                        
                        Spacer()
                        
                        Image(systemName: "phone.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(phone)
                            .font(Font.system(size: 11))
                    }
                    
                    HStack {
                        Image(systemName: "house.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(address)
                            .font(Font.system(size: 11))
                    }
                    
                }
                .padding(.leading, 20)
            }
            .padding([.leading, .trailing], 20)
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(
            image: "일광초등학교",
            school: "일광초등학교",
            description: "some description",
            zipCode: "46048",
            phone: "051-930-7770",
            address: "부산광역시 기장군 일광면 해빛로 46")
    }
}
