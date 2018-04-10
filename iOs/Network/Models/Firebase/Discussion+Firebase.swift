//
//  Discussion+Firebase.swift
//  ChatKeepcoding
//
//  Created by Fabio Gomez on 10/4/18.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension Discussion {
    
    class func mapper(snapshot: DataSnapshot) -> Discussion? {
        
        guard let json = snapshot.value as? [String:Any] else {
            return nil
        }
        
        let uid = json["uid"] as? String ?? ""
        let title = json["title"] as? String ?? ""
        let lastMessage = json["lastMessage"] as? String ?? ""
        
        return Discussion.init(uid: uid, title: title, lastMessage: lastMessage)
        
    }
    
}
