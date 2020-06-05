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
        
        NavigationView {
            TabView {
                
                Text("Taiman Posts")
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                        Text("Taiman Posts")
                    }
                
                Text("My Taiman")
                    .tabItem {
                        Image(systemName: "doc.on.doc")
                        Text("My Taiman")
                    }
                
                Text("Chat")
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Chat")
                    }
                
                Text("User Settings")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("User Settings")
                    }
                
            } //End of Tab View
                .navigationBarTitle("1v1 掲示板", displayMode: .inline)
                .navigationBarItems(trailing: Image(systemName: "plus.square.fill").imageScale(.large))
            
            
        } //End of Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
