//
//  TaimanRow.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/07.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanRow: View {
    
    var createdAt: String = "19:35"
    var fortniteId: String = "haku_mizuki"
    var description: String = "20時から1v1島でタイマンお願いします！青ポンプ、紫スカー、ミニポなし、グラップラーあり、落下ダメージなしでやります！中級者です！"
    var playerLevel: String = "上級者求む！"
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(createdAt)
                    .foregroundColor(Color.white)
                
                Text("FortniteID: \(fortniteId)")
                    .padding(.leading, 10)
                    .padding(.trailing, 60)
                    .font(.headline)
            }
            .padding()
            
            
            if self.playerLevel == "誰でもOK！" {
                
                HStack {
                    Text("誰でもOK！")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
            } else if self.playerLevel == "初心者同士で！" {
                
                HStack {
                    Text("初心者同士で！")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 1, green: 0.6519264126, blue: 0.8248052621, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            } else {
                
                HStack {
                    Text("上級者求む！")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
            } //End of playerLevel if statement
            
            HStack {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(description)
                        .lineSpacing(3)
                    
                    HStack {
                        Spacer()
                    }// Spacer用HStack(秀才)
                }
                
            }
            .padding()
            .background(Color(#colorLiteral(red: 1, green: 0.7143068517, blue: 0.5749579509, alpha: 1)))
            .cornerRadius(10)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 10)
            
        } //End of VStack
            .background(Color(#colorLiteral(red: 0.3431862491, green: 0.7568627596, blue: 0.7503025655, alpha: 0.6645708476)))
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
        
    } //End of View
}

struct TaimanRow_Previews: PreviewProvider {
    static var previews: some View {
        TaimanRow()
    }
}
