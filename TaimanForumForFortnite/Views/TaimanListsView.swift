//
//  TaimanListsView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanListsView: View {
    var body: some View {
                NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 25) {
    
                    Text("kamestry")
                    
                }
                
            } //End of Scroll View
            .navigationBarTitle("エントリーした1v1", displayMode: .inline)
            .background(Color(#colorLiteral(red: 0.09045508068, green: 0.1928802225, blue: 0.3444368101, alpha: 1)))
            
        } //End of Navigation View
    }
}

struct TaimanListsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanListsView()
    }
}
