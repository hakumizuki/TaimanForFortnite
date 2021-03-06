//
//  ContentView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        
            TabView {
                
                TaimanPostsView()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                        Text("1v1掲示板")
                    }
                
                TaimanListsView()
                    .tabItem {
                        Image(systemName: "doc.on.doc")
                        Text("マイ1v1")
                    }
                
                FinishRegistration()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("ID設定")
                    }
                
            } //End of Tab View
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
