//
//  TaimanListsView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/05.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanListsView: View {
    
    // Listenerで管理
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(#colorLiteral(red: 0.06126286834, green: 0.1292148232, blue: 0.2266941071, alpha: 1))
                
                ScrollView(showsIndicators: false) {
                    
                    if FUser.currentUser()?.isPlaying == false && FUser.currentUser()?.isRecruiting == false {
                        Text("まだ募集もエントリーもしていません。")
                            .font(.custom("NotoSansJP-Bold", size: 19))
                            .foregroundColor(Color.white)
                            .padding()
                        HStack {
                            Text("1v1掲示板の")
                                .font(.custom("NotoSansJP-Bold", size: 17))
                                .foregroundColor(Color.white)
                            Image(systemName: "plus.square.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))
                            Text("から募集してみましょう！")
                                .font(.custom("NotoSansJP-Bold", size: 17))
                                .foregroundColor(Color.white)
                        }
                    } else if FUser.currentUser()?.isPlaying == true {
                        // entriedPlayerがcurrentId()と同じTaimanを表示
                    } else if FUser.currentUser()?.isRecruiting == true {
                        // ownerIdがcurrentId()と同じTaimanを表示
                    } else {
                        Text("これもあるねんな。あるならログインビューをシートで表示できるボタンを設置するよ。")
                    }
                    
                } //End of Scroll View
                    .navigationBarTitle("エントリーした1v1", displayMode: .inline)
            } //End of ZStack
            
        } //End of Navigation View
    }
}

struct TaimanListsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanListsView()
    }
}
