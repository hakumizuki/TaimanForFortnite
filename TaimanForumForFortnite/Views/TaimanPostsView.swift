//
//  TaimanPostsView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanPostsView: View {
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 25) {
                    TaimanRow(createdAt: "19:42", fortniteId: "さしすせ蘇我氏", description: "ぶち殺します。1v1しましょう。", playerLevel: "誰でもOK！")
                    TaimanRow(createdAt: "19:39", fortniteId: "GW_Nephrite", description: "げーむうぃずそぞくの、ネフライトです！今日はダマ５匹見つけるまで帰れまてんをしていきたいと思いまth！" ,playerLevel: "誰でもOK！")
                    TaimanRow(createdAt: "19:20", fortniteId: "vabon.くらら", description: "ぷりっキュア！プリっキュあ！プーリキュッあ！プーりきゅっあ！", playerLevel: "上級者求む！")
                    TaimanRow(createdAt: "19:09", fortniteId: "GW_Hamuppi", description: "アジア１位とりました！", playerLevel: "初心者同士で！")
                    TaimanRow(createdAt: "19:03", fortniteId: "haku_mizuki", description: "1v1島でタイマンしましょ〜。青ポンプ、青ARのみで！スマホです！", playerLevel: "誰でもOK！")
                }
                
            }
            .navigationBarTitle("1v1 掲示板", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}){Image(systemName: "plus.square.fill").imageScale(.large).foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))})
            .background(Color(#colorLiteral(red: 0.09045508068, green: 0.1928802225, blue: 0.3444368101, alpha: 1)))
            // .sheet(isPresented:)でNew Postを追加
            
        }
        
    }
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}
