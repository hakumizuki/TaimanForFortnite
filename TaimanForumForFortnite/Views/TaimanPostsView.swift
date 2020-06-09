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
                    TaimanRow()
                    TaimanRow()
                    TaimanRow()
                    TaimanRow()
                    TaimanRow()
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
                    
                    AddTaiman()
                    
            }
            
        } //End of Navigation View
        
    } //End of View
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}
