//
//  FirebaseReference.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/06.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Taiman
    case Message
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
  return Firestore.firestore().collection(collectionReference.rawValue)
}
