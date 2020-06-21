//
//  FUser.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/09.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import FirebaseAuth

class FUser {
    let id: String
    var email: String
    var fortniteId: String
    var onBoarding: Bool
    var isPlaying: Bool
    var isRecruiting: Bool
    
    init(_id: String, _email: String, _fortniteId: String) {
        id = _id
        email = _email
        fortniteId = _fortniteId
        
        onBoarding = false
        isPlaying = false
        isRecruiting = false
    }
    
    init(_ dictionary: NSDictionary) {
        id = dictionary[kID] as? String ?? ""
        email = dictionary[kEMAIL] as? String ?? ""
        fortniteId = dictionary[kFORTNITEID] as? String ?? ""
        onBoarding = dictionary[kONBOARDING] as? Bool ?? false
        isPlaying = dictionary[kISPLAYING] as? Bool ?? false
        isRecruiting = dictionary[kISRECRUITING] as? Bool ?? false
    }
    
    
    class func currentId() -> String {
        
        return Auth.auth().currentUser!.uid
    }
    
    class func currentUser() -> FUser? {
        
        if Auth.auth().currentUser != nil {
            
            if let dictionary = userDefaults.object(forKey: kCURRENTUSER) {
                return FUser.init(dictionary as! NSDictionary)
            }
            
        }
        
        return nil
    }
    
    class func loginUserWith(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            
            if error == nil {
                if authDataResult!.user.isEmailVerified {
                    
                    downloadUserFromFirestore(userId: authDataResult!.user.uid, email: email) { (error) in
                        
                        completion(error, true)
                        
                    }
                    
                } else {
                    completion(error, false)
                }
                
                
            } else {
                completion(error, false)
            }
            
        }
        
    }
    
    class func registerUserWith(email: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            
            
                completion(error)
           
            
            if error == nil {
                
                authDataResult!.user.sendEmailVerification { (error) in
                    print("verification error is: ", error?.localizedDescription ?? "UNKNOWN")
                }
            }
        }
    }
    
    class func resetPassword(email: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            completion(error)
        }
    }
    
    class func logOutUser(completion: @escaping (_ error: Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            
            userDefaults.removeObject(forKey: kCURRENTUSER)
            userDefaults.synchronize()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}

func userDictionaryFrom(user: FUser) -> [String: Any] {
    
    return NSDictionary(objects: [
            user.id,
            user.email,
            user.fortniteId,
            user.onBoarding,
            user.isPlaying,
            user.isRecruiting
        ],
                        forKeys: [
            kID as NSCopying,
            kEMAIL as NSCopying,
            kFORTNITEID as NSCopying,
            kONBOARDING as NSCopying,
            kISPLAYING as NSCopying,
            kISRECRUITING as NSCopying
    ]) as! [String : Any]
    
}

func downloadUserFromFirestore(userId: String, email: String, completion: @escaping (_ error: Error?) -> Void) {
    
    FirebaseReference(.User).document(userId).getDocument { (snapshot, error) in
        
        guard let snapshot = snapshot else { return }
        
        if snapshot.exists {
            
            // すでにアカウントを持っていて、DBにUserとして登録されている場合
            saveUserLocally(userDictionary: snapshot.data()! as NSDictionary)
            
        } else {
            
            // 新規アカウント作成時、ローカルに加え、UserとしてDBに保管される
            let user = FUser(_id: userId, _email: email, _fortniteId: "")
            saveUserLocally(userDictionary: userDictionaryFrom(user: user) as NSDictionary)
            saveUserToFirestore(fUser: user)
        }
        
        completion(error)
        
    }
    
}

func saveUserToFirestore(fUser: FUser) {
    
    FirebaseReference(.User).document(fUser.id).setData(userDictionaryFrom(user: fUser)) { (error) in
        
        if error != nil {
            print("Error creating FUser object: ", error!.localizedDescription)
        }
        
    }
}

func saveUserLocally(userDictionary: NSDictionary) {
    
    userDefaults.set(userDictionary, forKey: kCURRENTUSER)
    userDefaults.synchronize()
    
}

func updateCurrentUser(withValues: [String: Any], completion: @escaping (_ error: Error?) -> Void) {
    
    if let dictionary = userDefaults.object(forKey: kCURRENTUSER) {
        
        let userObject = (dictionary as! NSDictionary).mutableCopy() as! NSMutableDictionary
        
        userObject.setValuesForKeys(withValues)
        
        FirebaseReference(.User).document(FUser.currentId()).updateData(withValues) { (error) in
            
            if error == nil {
                saveUserLocally(userDictionary: userObject)
            } else {
                print("Error updating current user:", error!.localizedDescription)
            }
            completion(error)
        }
    }
}

func updateCurrentUserOnline(with values: [String: Any], completion: @escaping (_ error: Error?) -> Void) {
    FirebaseReference(.User).document(FUser.currentId()).updateData(values) { (error) in
        if error == nil {
            print("User has updated online successfully.")
        } else {
            print("Error updating User online: ", error!.localizedDescription)
        }
        completion(error)
    }
}
