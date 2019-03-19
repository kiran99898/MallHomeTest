//
//  MenuModel.swift
//  MallHomeTest
//
//  Created by kiran on 3/14/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation


struct MenuModel: Codable {
    var termID: Int
    var name, slug: String
    var parent, count: Int
    var filter: String
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case termID = "term_id"
        case name
        case slug
        case parent
        case count
        case filter
        case items
    }
    
}

struct Item: Codable {
    let id: Int
    let postAuthor, postDate: String
    let postTitle, postExcerpt, postStatus, commentStatus: String
    let postParent: Int
    let postType: String
    let dbID: Int
    let menuItemParent, objectID, object, type: String
    let typeLabel: String
    let url: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case postAuthor = "post_author"
        case postDate = "post_date"
        case postTitle = "post_title"
        case postExcerpt = "post_excerpt"
        case postStatus = "post_status"
        case commentStatus = "comment_status"
        case postParent = "post_parent"
        case postType = "post_type"
        case dbID = "db_id"
        case menuItemParent = "menu_item_parent"
        case objectID = "object_id"
        case object = "object"
        case type = "type"
        case typeLabel = "type_label"
        case url = "url"
        case title = "title"
        
    }
}
