//
//  TaimanPostsView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanPostsView: View {
    @State private var showingAddTaiman = false
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 25) {
                    TaimanRow(createdAt: "19:58", fortniteId: "Haku", battleMode: "建築バトル", weaponsRule: "青ポンプと紫スカー", playerLevel: "初心者同士で！", fallDamage: "なし", grappler: "あり", healItem: "あり")
                    TaimanRow(createdAt: "19:56", fortniteId: "GW_Neph", battleMode: "建築バトル", weaponsRule: "青武器のみ", playerLevel: "上級者求む！", fallDamage: "なし", grappler: "あり", healItem: "なし")
                    TaimanRow(createdAt: "19:49", fortniteId: "vabon", battleMode: "建築バトル", weaponsRule: "話し合って決める", playerLevel: "誰でもOK!", fallDamage: "なし", grappler: "あり", healItem: "あり")
                    TaimanRow(createdAt: "19:40", fortniteId: "Ninja", battleMode: "ZoneWar", weaponsRule: "青ポンプと紫スカー", playerLevel: "誰でもOK！", fallDamage: "おまかせ", grappler: "おまかせ", healItem: "おまかせ")
                }
                
            } //End of Scroll View
            .navigationBarTitle("1v1 掲示板", displayMode: .inline)
            .navigationBarItems(trailing:
                
                Button(action: {
                    self.showingAddTaiman.toggle()
                }){Image(systemName: "plus.square.fill").imageScale(.large).foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))})
                .background(ZStack{
                    
                    Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 1))

                    Image("Taiman_For_Fortnite_appIcon").resizable().aspectRatio(contentMode: .fit)})
            .sheet(isPresented: $showingAddTaiman) {
             
                if FUser.currentUser() != nil &&
                    FUser.currentUser()!.onBoarding {
                    
                    AddTaiman()
                    
                } else if FUser.currentUser() != nil  {
                    FinishRegistration()
                } else {
                    LoginView()
                }
                    
            }
        } //End of Navigation View
        
    } //End of View
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}
