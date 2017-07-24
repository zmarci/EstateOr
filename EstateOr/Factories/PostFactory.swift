//
//  PostFactory.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 22..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class PostFactory {
    
    static func createPost(fromJSON json: JSON) -> Post? {
        
        let realm = try! Realm()
        
        var post: Post!
        
        let id = json["data"]["id"].stringValue
        
        if let existingPost = Post.findPost(withId: id)  {
            
            try! realm.write {
                
                post = existingPost.fillPost(withJsonData: json)
                realm.add(post, update: true)
            }
            
            return post
            
        } else {
            
            let tempPost = Post()
            tempPost.id = id
            
            post = tempPost.fillPost(withJsonData: json)
            
            try! realm.write {
                realm.add(post, update: true)
            }
            
            return post
        }
    }
 
    static func createPostsList(fromJSON json: JSON) -> [Post] {
        
        return json.flatMap {
            return createPost(fromJSON: $0.1)
        }
    }
}
