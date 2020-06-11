//
//  TaimanPostsView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanPostsView: View {
    
    @ObservedObject var taimanListener = TaimanListener()
    
    @State private var showingAddTaiman = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 1))
                
                Image("Taiman_For_Fortnite_appIcon").resizable().aspectRatio(contentMode: .fit)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 25) {
                        ForEach(self.taimanListener.taimans ?? [], id: \.self.id) { taiman in
                            TaimanRow(taiman: taiman)
                        }
                    }
                    
                } //End of Scroll View
                    .navigationBarTitle("1v1 掲示板", displayMode: .inline)
                    .navigationBarItems(trailing:
                        
                        Button(action: {
                            self.showingAddTaiman.toggle()
                        }){Image(systemName: "plus.square.fill").imageScale(.large).foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))})
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
                
            }
        } //End of Navigation View
        
    } //End of View
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}
