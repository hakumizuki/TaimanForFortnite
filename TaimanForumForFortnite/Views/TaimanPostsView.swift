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
    
    var taimans: [Taiman] {
        .init(self.taimanListener.taimans)
    }
    
    @State private var showingAddTaiman = false
    @State private var showingAlertA = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 1))
                
                VStack(alignment: .center) {
                    oneVone()
                        .padding(.top, -50)
                    Spacer()
                    forFortnite()
                        .padding(.bottom, -30)
                }
                
                if self.taimans == [] {
                    ScrollView(showsIndicators: false) {
                        LottieView(filename: "lf30_editor_ExugZy", loopMode: .loop)
                            .frame(width: 90, height: 90, alignment: .center)
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
                                
                            } else if FUser.currentUser() != nil {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 25) {
                            ForEach(self.taimans, id: \.self.id) { taiman in
                                TaimanRow(taiman: taiman)
                            }
                        }
                    } //End of Scroll View
                        .navigationBarTitle("1v1 掲示板", displayMode: .inline)
                        .navigationBarItems(leading:
                            Button(action: {
                                FUser.logOutUser { (error) in
                                    print("Error loging out user: ", error?.localizedDescription ?? "nothing")
                                }
                            }, label: {
                                Text("ログアウト")
                            }))
                        .navigationBarItems(trailing:
                            
                            Button(action: {
                                if FUser.currentUser()?.isRecruiting == true || FUser.currentUser()?.isPlaying == true {
                                    self.showingAlertA = true
                                } else {
                                    self.showingAddTaiman.toggle()
                                }
                            }){Image(systemName: "plus.square.fill").imageScale(.large).foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))})
                        .alert(isPresented: $showingAlertA, content: {
                            
                            if FUser.currentUser()?.isRecruiting == true {
                                return Alert(title: Text("まった！"), message: Text("現在募集中の1v1があります。削除して新しく投稿するか、もう少し待ってみてください。"), primaryButton: .destructive(Text("削除する"), action: {
                                    
                                    // 削除して新しい投稿ページに移動
                                    FirebaseReference(.Taiman).document(FUser.currentId()).delete()
                                    updateCurrentUser(withValues: [kISRECRUITING: false]) { (error) in
                                        if error != nil {
                                            print("募集の取り消しに失敗しました。")
                                        }
                                    }
                                    // 投稿ページへ
                                    self.showingAddTaiman.toggle()
                                }), secondaryButton: .default(Text("少し待つ")))
                            } else {
                                return Alert(title: Text("プレイ中です！"), message: Text("現在プレイ中の1v1があります。終了するか、ゲームを続行してください。"), primaryButton: .destructive(Text("終了する"), action: {
                                    
                                    //TODO: ゲームを終了して、相手にも通知を送りつつ、deleteする。
                                    
                                }), secondaryButton: .default(Text("続行する")))
                            }
                            
                        })
                        .sheet(isPresented: $showingAddTaiman) {
                            
                            if FUser.currentUser() != nil &&
                                FUser.currentUser()!.onBoarding {
                                
                                AddTaiman()
                                
                            } else if FUser.currentUser() != nil {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                    }
                }
            } //End of Scroll View
        } //End of Navigation View
        
    } //End of View
}

struct TaimanPostsView_Previews: PreviewProvider {
    static var previews: some View {
        TaimanPostsView()
    }
}

struct oneVone: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            Image("Taiman_For_Fortnite_appIcon")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
            
            Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 1))
                .frame(width: 300, height: 100, alignment: .center)
                .padding(.top, -100)
        }
        
    }
}

struct oneVone_Previews: PreviewProvider {
    static var previews: some View {
        oneVone()
    }
}


struct forFortnite: View {
    var body: some View {
        
        ZStack {
            Image("Taiman_For_Fortnite_appIcon")
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
            
            Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 1))
                .frame(width: 300, height: 150, alignment: .center)
                .padding(.bottom, 105)
        }
        
    }
}

struct forFortnite_Previews: PreviewProvider {
    static var previews: some View {
        forFortnite()
    }
}
