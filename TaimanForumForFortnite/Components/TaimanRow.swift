//
//  TaimanRow.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/07.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct TaimanRow: View {
    
    // for sheet
    @State private var showLogin = false
    
    // for alert
    @State private var showingAlertA = false
    
    var taiman: Taiman
    
    var bodyBorderColor: Color {
        if self.taiman.ownerId == FUser.currentUser()?.fortniteId {
            return Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 0.8761772261))
        } else {
            return Color(#colorLiteral(red: 0.4077987218, green: 0.9042493395, blue: 0.9042493395, alpha: 0))
        }
    }
    
    var bodyColor: Color {
        if self.taiman.isEntried {
            return Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 0.8761772261))
        } else {
            return Color(#colorLiteral(red: 0.3431862491, green: 0.7568627596, blue: 0.7503025655, alpha: 0.8831068065))
        }
    }
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text(getDate(from: taiman.createdAt))
                        .foregroundColor(Color.white)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("FortniteID:")
                        .padding(.leading, 10)
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        
                        Text("\(String(taiman.ownerId.prefix(3)))**********")
                            .padding(.leading, 10)
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.black)
                        Divider()
                    }
                    
                    
                    
                } //End of HStack with time and ID
                    .padding()
                
                HStack {
                    Text("対戦モード: \(taiman.battleMode)")
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                    Spacer()
                }  //End of Battle Mode
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)).opacity(0.7), lineWidth: 5)
                    )
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .shadow(radius: 5)
                
                HStack {
                    Text("武器ルール: \(taiman.weaponsRule)")
                        .font(.custom("NotoSansJP-Bold", size: 17))
                        .foregroundColor(Color.white)
                        .padding(.all, 8)
                    
                    Spacer()
                }  //End of Weapons Rule
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)).opacity(0.7), lineWidth: 5)
                    )
                    .cornerRadius(10)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .shadow(radius: 5)
                
                if taiman.playerLevel == "誰でもOK！" {
                    
                    HStack {
                        Text("誰でもOK！")
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                        Spacer()
                    } //playerLevelで分岐
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.7), lineWidth: 5)
                        )
                        .cornerRadius(10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .shadow(radius: 5)
                    
                } else if taiman.playerLevel == "初心者同士で！" {
                    
                    HStack {
                        Text("初心者同士で！")
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                        Spacer()
                    } //playerLevelで分岐
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 1, green: 0.6519264126, blue: 0.8248052621, alpha: 1)).opacity(0.7), lineWidth: 5)
                        )
                        .cornerRadius(10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .shadow(radius: 5)
                    
                } else {
                    
                    HStack {
                        Text("上級者求む！")
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                        Spacer()
                    } //playerLevelで分岐
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)).opacity(0.7), lineWidth: 5)
                        )
                        .cornerRadius(10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .shadow(radius: 5)
                    
                } //End of playerLevel if statement
                
                HStack {
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        Text("落下ダメ")
                            .foregroundColor(Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)))
                            .font(.custom("NotoSansJP-Bold", size: 17))
                        
                        Text(taiman.fallDamage)
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        Text("グラップラー")
                            .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                            .font(.custom("NotoSansJP-Bold", size: 17))
                        
                        Text(taiman.grappler)
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        Text("回復アイテム")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6575947753, blue: 0.2079369034, alpha: 1)))
                            .font(.custom("NotoSansJP-Bold", size: 17))
                        
                        Text(taiman.healItem)
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                        
                    }
                    
                    
                }
                .padding()
                
                
            } //End of VStack
                .background(self.bodyColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(self.bodyBorderColor, lineWidth: 6)
                )
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            
            
            //エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！
            // エントリー済みの表記については、currentUserと比較して他のユーザーがエントリーしました。
            // みたいな表記にすべきでしょう。アニメーションもなし。または、クロスマーク。
            if self.taiman.ownerId == FUser.currentUser()?.fortniteId {
                // なし
            } else if self.taiman.isEntried {
                HStack {
                    Spacer()
                
                    LottieView(filename: "782-check-mark-success", loopMode: .playOnce)
                        .frame(width: 60, height: 60, alignment: .center)
                        .padding(.all ,5)
                    
                    Button(action: {
                        // Already Entried
                    }) {
                        Text("エントリー済み")
                            .frame(width: 160, height: 40, alignment: .center)
                            .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .background(Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 0.8010755565)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), lineWidth: 4)
                            )
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.leading)
                            .padding(.trailing, 5)
                    }
                } //End of HStack
                .padding(.trailing)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
                .frame(width: 275, height: 70)
                .cornerRadius(10)
            } else {
                HStack {
                    Spacer()
                
                    LottieView(filename: "lf30_editor_hAbUdI", loopMode: .loop)
                        .frame(width: 70, height: 70, alignment: .center)
                    
                    
                    Button(action: {
                        
                        if FUser.currentUser()?.isRecruiting == true || FUser.currentUser()?.isPlaying == true {
                            self.showingAlertA.toggle()
                        } else {
                            
                            // Entry
                            if FUser.currentUser() != nil &&
                                FUser.currentUser()!.onBoarding {
                                
                                FirebaseReference(.Taiman).document(self.taiman.id).updateData([kISENTRIED : true, kENTRIEDPLAYER: FUser.currentUser()!.fortniteId]) { (error) in
                                    
                                    if error != nil {
                                        print("エントリーできませんでした。")
                                    } else {
                                        updateCurrentUser(withValues: [kISPLAYING: true]) { (error) in
                                            if error != nil {
                                                print("ユーザーを更新できませんでした。(isPlaying: true)")
                                            } else {
                                                // TODO: animation on tabbar prompting to go list
                                            }
                                        }
                                    }
                                }
                            } else {
                                // ログインされていなければログイン画面表示
                                self.showLogin.toggle()
                            }
                        }
                    }) {
                        Text("エントリーする")
                            .frame(width: 160, height: 40, alignment: .center)
                            .foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))
                            .font(.custom("NotoSansJP-Bold", size: 17))
                            .background(Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 0.8010755565)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), lineWidth: 4)
                        )
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.leading)
                            .padding(.trailing, 5)
                    } //End of Entry Button
                        .sheet(isPresented: $showLogin) {
                            if FUser.currentUser() != nil  {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                    }
                    .alert(isPresented: $showingAlertA, content: {
                        
                        if FUser.currentUser()?.isRecruiting == true {
                            return Alert(title: Text("まった！"), message: Text("現在募集中の1v1があります。削除するか、もう少し待ってみてください。"), primaryButton: .destructive(Text("削除する"), action: {
                                
                                // 削除して新しい投稿ページに移動
                                updateCurrentUser(withValues: [kISRECRUITING: false]) { (error) in
                                    if error != nil {
                                        print("募集の取り消しに失敗しました。")
                                    } else {
                                        // 削除
                                        FirebaseReference(.Taiman).document(FUser.currentId()).delete()
                                    }
                                }      }), secondaryButton: .default(Text("少し待つ")))
                        } else {
                            return Alert(title: Text("プレイ中です！"), message: Text("現在プレイ中の1v1があります。終了するか、ゲームを続行してください。"), primaryButton: .destructive(Text("終了する"), action: {
                                
                                //TODO: ゲームを終了して、相手にも通知を送りつつ、deleteする。
                                
                            }), secondaryButton: .default(Text("続行する")))
                        }
                        
                    })
            //エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！　エントリーボタン！
                    
                    
                } //End of HStack
                .padding(.trailing)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
                .frame(width: 275, height: 70)
                .cornerRadius(10)
            } //End of if isEntried else statement
            
        } //End of VStack
        
    } //End of View
}

struct TaimanRow_Previews: PreviewProvider {
    static var previews: some View {
        TaimanRow(taiman: Taiman(id: "test", createdAt: Date(), ownerId: "haku_mizuki", battleMode: "ZoneWar", playerLevel: "誰でもOK！", weaponsRule: "話し合って決める", fallDamage: "なし", grappler: "あり", healItem: "あり", isEntried: false, entriedPlayer: ""))
    }
}

func getDate(from createdAt: Date) -> String{
    let time = createdAt
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "HH:mm"
    let stringDate = timeFormatter.string(from: time)
    return stringDate
}
