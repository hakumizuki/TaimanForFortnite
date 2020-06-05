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
        
        NavigationView{
            
            List {
                Text("Post")
            }
            .navigationBarTitle("1v1 掲示板", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "plus.square.fill").imageScale(.large))
            // .sheet(isPresented:)でNew Postを追加
            
        }
        
    }
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}
