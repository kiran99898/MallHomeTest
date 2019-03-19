//
//  ProductResponse.swift
//  MallHomeTest
//
//  Created by kiran on 3/14/19.
//  Copyright © 2019 kiran. All rights reserved.
//


import Foundation

struct ProductResponse: Codable {
    var id: Int?
    var name: String?
    var slug: String?
    var permalink: String?
    var dateCreated: String?
    var description: String?
    var shortDescription: String?
    var sku: String?
    var price: String?
    var regularPrice: String?
    var salePrice: String?
    var priceHtml: String?
    var image: [ProductImageResponse]?
    var catagories: [CatagoriesResponse]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case permalink = "permalink"
        case dateCreated = "date_created"
        case description = "description"
        case shortDescription = "short_description"
        case sku = "sku"
        case price = "price"
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case priceHtml = "price_html"
        case image = "images"
        case catagories = "categories"
    }
}

struct ProductImageResponse: Codable {
    var id: Int?
    var source: String?
    var name: String?
    var alt: String?
    var position: Int
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case source = "src"
        case name = "name"
        case alt = "alt"
        case position = "position"
    }
}

struct CatagoriesResponse: Codable {
    var id: Int
    var name: String
    var slug: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case slug = "slug"
    }
}
