//
//  UserListener.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/20.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import Firebase

class UserListener: ObservableObject {
    
    @Published var user = FUser(_id: "", _email: "", _fortniteId: "")
    
    init(currentUserId: String) {
        downloadUser(userId: currentUserId)
    }
    
    private func downloadUser(userId: String) {
        FirebaseReference(.User).document(userId).addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            if snapshot.exists {
                self.user = UserListener.userFromDictionary(snapshot)
            }
        }
    }
    
    static func userFromDictionary(_ snapshot: DocumentSnapshot) -> FUser {
        var user = FUser(_id: "", _email: "", _fortniteId: "")
        
        if let userData = snapshot.data() {
            user = FUser(userData as NSDictionary)
        }
        return user
    }
}
