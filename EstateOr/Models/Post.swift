//
//  Post.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 24..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Post: Object {
    
    dynamic var id                      : String = ""
    dynamic var author                  : String = ""
    dynamic var score                   : Int = 0
    dynamic var over18                  : Bool = false
    dynamic var previewImageUrl         : String = ""
    dynamic var title                   : String = ""
    dynamic var createdTimeStamp        : Date = Date()
    dynamic var subRedditNamePrefixed   : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }

    static func findPost(withId searchId: String) -> Post? {
        
        let realm = try! Realm()
        
        //let fetchedPosts = realm.objects(Post.self).filter("id = \(id)")
        
        let fetchedPost = realm.object(ofType: Post.self, forPrimaryKey: searchId)
    
        return fetchedPost
        
    }
    
    func fillPost(withJsonData json: JSON) -> Post {
        
        author                     = json["data"]["author"].stringValue
        score                      = json["data"]["score"].intValue
        over18                     = json["data"]["over_18"].boolValue
        
        let imagesArray = json["data"]["preview"]["images"]
        
        if let firstImageDictionary = imagesArray.first {
            
            previewImageUrl         = firstImageDictionary.1["source"]["url"].stringValue
            
        }
        
        title                      = json["data"]["title"].stringValue
        createdTimeStamp           = Date(timeIntervalSince1970: json["data"]["created_utc"].doubleValue)
        subRedditNamePrefixed      = json["data"]["subreddit_name_prefixed"].stringValue
        
        return self
    }
}


/*

{
    "kind": "t3",
    "data": {
        "contest_mode": false,
        "approved_at_utc": null,
        "banned_by": null,
        "media_embed": {
            
        },
        "thumbnail_width": 140,
        "subreddit": "travel",
        "selftext_html": null,
        "selftext": "",
        "likes": null,
        "suggested_sort": null,
        "user_reports": [
        
        ],
        "secure_media": null,
        "link_flair_text": "Images",
        "id": "6p0oot",
        "banned_at_utc": null,
        "view_count": null,
        "secure_media_embed": {
            
        },
        "clicked": false,
        "report_reasons": null,
        "author": "charles_tully",
        "saved": false,
        "mod_reports": [
        
        ],
        "can_mod_post": false,
        "name": "t3_6p0oot",
        "score": 11340,
        "approved_by": null,
        "over_18": false,
        "domain": "i.redd.it",
        "hidden": false,
        "preview": {
            "images": [
            {
            "source": {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?s=0cc855c937f93ce4f170ddfb1d528183",
            "width": 1618,
            "height": 1080
            },
            "resolutions": [
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=108&amp;s=cd01cd327caa61e4124c2209283adf3b",
            "width": 108,
            "height": 72
            },
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=216&amp;s=20e3c4d68cada79b1fb2a366edd0ce41",
            "width": 216,
            "height": 144
            },
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=320&amp;s=be50f26eba21d897a51edc1d2513bc62",
            "width": 320,
            "height": 213
            },
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=640&amp;s=9f12295ef6e2cde32e0304b69f0d4d5d",
            "width": 640,
            "height": 427
            },
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=960&amp;s=e4d68ece0b2eef50e18b47c11ab3a991",
            "width": 960,
            "height": 640
            },
            {
            "url": "https://i.redditmedia.com/28bJBAuvCFk7NYqsOlXo7mMseYWf3rV5V7IlN6ULq9s.jpg?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=1080&amp;s=6e64b6e9423d8bfcb7448ac356144d80",
            "width": 1080,
            "height": 720
            }
            ],
            "variants": {
            
            },
            "id": "1D3bin1fptgGfsCZH3pKe76U2kHweridnlAhMwgVtv8"
            }
            ],
            "enabled": true
        },
        "thumbnail": "https://b.thumbs.redditmedia.com/BzaS1d-ZL8NpFOvMBP5u2DIaeQ8dWVaKMLxXMr_mLWY.jpg",
        "subreddit_id": "t5_2qh41",
        "edited": false,
        "link_flair_css_class": "images",
        "author_flair_css_class": null,
        "gilded": 0,
        "downs": 0,
        "brand_safe": true,
        "archived": false,
        "removal_reason": null,
        "post_hint": "image",
        "can_gild": false,
        "thumbnail_height": 93,
        "hide_score": false,
        "spoiler": false,
        "permalink": "/r/travel/comments/6p0oot/i_was_in_cobh_co_cork_ireland_the_last_port_the/",
        "num_reports": null,
        "locked": false,
        "stickied": false,
        "created": 1500835146.0,
        "url": "https://i.redd.it/q96ewle5mbbz.jpg",
        "author_flair_text": null,
        "quarantine": false,
        "title": "I was in Cobh; Co. Cork; Ireland! The last port the Titanic left from, and a very lovely little town.",
        "created_utc": 1500806346.0,
        "subreddit_name_prefixed": "r/travel",
        "distinguished": null,
        "media": null,
        "num_comments": 205,
        "is_self": false,
        "visited": false,
        "subreddit_type": "public",
        "is_video": false,
        "ups": 11340
    }
},

*/
