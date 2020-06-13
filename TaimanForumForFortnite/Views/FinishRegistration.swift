//
//  FinishRegistration.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/10.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct FinishRegistration: View {
    
    @State var fortniteId = FUser.currentUser()?.fortniteId ?? ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack {
            Text("フォートナイトのIDを登録する")
                .font(.custom("NotoSansJP-Bold", size: 23))
                .padding([.top, .bottom], 20)
            
            VStack(alignment: .leading) {
                
                Text("Fortnite ID")
                    .font(.custom("NotoSansJP-Bold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.init(.label))
                    .opacity(0.75)
                
                TextField("ゲーム中のIDを入力してください", text: $fortniteId)
                    .autocapitalization(.none)
                Divider()
                
            }
            .padding([.leading, .trailing, .bottom], 20)
            .padding(.top, 50)
            
            Button(action: {
                self.finishRegistration()
            }, label: {
                Text("登録を完了")
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))
                    .font(.custom("NotoSansJP-Bold", size: 17))
                    .background(Color(#colorLiteral(red: 0.06126286834, green: 0.1292148232, blue: 0.2266941071, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.top, 45)
            })
            .disabled(!self.fieldCompleted())
            
            Spacer()
        } //End of VStack
    } //End of Body
    
    
    private func fieldCompleted() -> Bool {
        
        return self.fortniteId != ""
    }
    
    private func finishRegistration() {
        
        updateCurrentUser(withValues: [kFORTNITEID: fortniteId, kONBOARDING: true]) { (error) in
            
            if error != nil {
                print("Error updating user: ", error!.localizedDescription)
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
}

struct FinishRegistration_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistration()
    }
}
