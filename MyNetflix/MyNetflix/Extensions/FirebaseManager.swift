//
//  FirebaseManager.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/14.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    static let shared = FirebaseManager()
    private let reference = Database.database().reference()
}

extension FirebaseManager {
    
    public func removeData(_ term: String) {
        let reference = self.reference.child("searchHistory").child(term)
        reference.removeValue()
        reference.removeValue { (error, _) in
            print(error?.localizedDescription ?? "")
        }
    }
}
