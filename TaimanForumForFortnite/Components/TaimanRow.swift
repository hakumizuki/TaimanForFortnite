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
    var battleMode: String = "建築バトル"
    var weaponsRule: String = "青ポンプと紫スカー"
    var playerLevel: String = "上級者求む！"
    var fallDamage: String = "なし"
    var grappler: String = "あり"
    var healItem: String = "おまかせ"
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(createdAt)
                    .foregroundColor(Color.white)
                
                Text("FortniteID: \(fortniteId)")
                    .padding(.leading, 10)
                    .padding(.trailing, 60)
                    .font(.headline)
            } //End of HStack with time and ID
            .padding()
            
            HStack {
                Text("\(battleMode)で勝負")
                    .font(.custom("NotoSansJP-Bold", size: 17))
                    .foregroundColor(Color.white)
                    .padding(.all, 8)
                
                Spacer()
            }  //End of Battle Mode
                .background(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                .cornerRadius(10)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .shadow(radius: 5)
            
            HStack {
                Text(weaponsRule)
                    .font(.custom("NotoSansJP-Bold", size: 17))
                    .foregroundColor(Color.white)
                    .padding(.all, 8)
                
                Spacer()
            }  //End of Weapons Rule
                .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                .cornerRadius(10)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .shadow(radius: 5)
            
            if self.playerLevel == "誰でもOK！" {
                
                HStack {
                    Text("誰でもOK！")
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .shadow(radius: 5)
                
            } else if self.playerLevel == "初心者同士で！" {
                
                HStack {
                    Text("初心者同士で！")
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 1, green: 0.6519264126, blue: 0.8248052621, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .shadow(radius: 5)
                
            } else {
                
                HStack {
                    Text("上級者求む！")
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                    Spacer()
                } //playerLevelで分岐
                    .background(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .shadow(radius: 5)
                
            } //End of playerLevel if statement
            
            HStack {
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("落下ダメ")
                        .foregroundColor(Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)))
                        .font(.custom("NotoSansJP-Bold", size: 17))
                    
                    Text(fallDamage)
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("グラップラー")
                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        .font(.custom("NotoSansJP-Bold", size: 17))
                    
                    Text(grappler)
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("回復アイテム")
                        .foregroundColor(Color(#colorLiteral(red: 0.0001157692242, green: 0.6021736141, blue: 0.1825375916, alpha: 1)))
                        .font(.custom("NotoSansJP-Bold", size: 17))
                    
                    Text(healItem)
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                }
                
                
            }
            .padding()
            
            
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
