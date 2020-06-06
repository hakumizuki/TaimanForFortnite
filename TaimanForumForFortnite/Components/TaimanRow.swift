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
    var description: String = "20時から1v1島でタイマンしましょ〜！中級者です！"
    
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            HStack {
                Text(createdAt)
                    .foregroundColor(Color.white)
                    .padding(.leading, -20)
                
                Text("FortniteID: \(fortniteId)")
                    .padding(.leading, 10)
                    .padding(.trailing, 60)
                    .font(.headline)
            }
            .padding()
            .padding(.bottom, -5)
            
            HStack {
                Text("初心者OK!")
                    .font(.headline)
                    .padding()
                
                Spacer()
            } //playerLevelで分岐
            .background(Color(#colorLiteral(red: 1, green: 0.6531180507, blue: 0.7890287235, alpha: 1)))
            .cornerRadius(10)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            Text(description)
                .padding()
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(10)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
            
            
        } //End of VStack
        .background(Color(#colorLiteral(red: 0.3431862491, green: 0.7568627596, blue: 0.7503025655, alpha: 0.6645708476)))
        .cornerRadius(10)
        .shadow(radius: 10)
        
        
    } //End of View
}

struct TaimanRow_Previews: PreviewProvider {
    static var previews: some View {
        TaimanRow()
    }
}
