//
//  DiscussionFirebase.swift
//  ChatKeepcoding
//
//  Created by Fabio Gomez on 10/4/18.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

public class DiscussionFirebase: DiscussionManager {
    
    var ref = Database.database().reference().child("discussions")
    
    public func list(onSuccess: @escaping ([Discussion]) -> Void, onError: ErrorClosure?) {
        
        self.ref.observe(.value, with: { (snapshot) in
            
            let discussions = snapshot.children
                .flatMap({ Discussion.mapper(snapshot: $0 as! DataSnapshot) })
                .sorted(by: { $0.uid > $1.uid })
            
            onSuccess(discussions)
            
        }) { (error) in
            print(error)
        }
        
        
    }
    
}
