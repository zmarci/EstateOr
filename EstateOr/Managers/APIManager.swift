//
//  APIManager.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 22..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    static func request(withURL URL: String, method: HTTPMethod = .get, completion: @escaping (_ success: Bool, _ responseJson: JSON?) -> ())  {
        
        Alamofire.request(URL, method: method).responseJSON { response in
            
            guard let jsonString = response.result.value else {
                completion(false, nil)
                return
            }
            
            let json = JSON(jsonString)
            
            guard json != JSON.null else {
                
                completion(true, nil)
                return
                
            }
            
            completion(true,json)
            
        }
    }
    
    static func fetchPosts(completion: @escaping (_ success: Bool, _ responsePostsList: [Post]?) -> ())  {
        
        let URL = APIRoutes.travelPosts
        
        request(withURL: URL) { success, responseJson in
            
            guard let responseJson = responseJson, success else {
                
                completion(false, nil)
                return
                
            }
            
            let postsList = PostFactory.createPostsList(fromJSON: responseJson["data"]["children"])
                
            completion(true, postsList)
        }
    }
}
