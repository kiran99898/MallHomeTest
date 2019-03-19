//
//  ApiManager.swift
//  MallHomeTest
//
//  Created by kiran on 3/14/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire



var GET_PRODUCTCAT_FROM_MALL_URL = "https://ozairamall.com/wp-json/menus/v1/menus/"
var GET_PRODUCTS_FROM_CAT_ID_URL = "https://ozairamall.com/wp-json/wc/v2/products/"

class APIManager {
    
    static let api = APIManager()
    private init(){}
    
    
    func fetchCatagoryOfMall(mall: String) -> Promise<[Item]> {
        let urll = GET_PRODUCTCAT_FROM_MALL_URL + "\(mall)"
        
        return Promise {
            resolver in
            
            Alamofire.request(urll).responseString {
                response in
                
                switch(response.result){
                case .success(let data):
                    
                    var menuData = [Item]()
                    if let json = data.data(using: .utf8){
                        
                        do {
                            let menuRes = try JSONDecoder().decode(MenuModel.self, from: json)
                            for menu in menuRes.items {
                                menuData.append(menu)
                            }
                            
                            resolver.fulfill(menuData)
                            
                        }catch(let error){
                            print(error)
                            
                        }
                        
                    }
                  //  print("my actual response is :- ",data)
                    
                case .failure(let error):
                    resolver.reject(error)
                    print(error)
                }
            }
            
        }
    }
    
    // MARK:- FETCH PRODUCTS FROM ID
    func fetchProductsDatafromCatagoryId(params:[String: Any]) -> Promise<[ProductResponse]> {
        return Promise {
            resolver in
            
            Alamofire.request(GET_PRODUCTS_FROM_CAT_ID_URL, parameters: params).responseString{
                response in
                
                switch(response.result){
                case .success(let data):
                    
                    var productsArray = [ProductResponse]()
                    //error response shol be handled
                    
                    if let json = data.data(using: .utf8){
                        
                        do {
                            let productsResponse = try JSONDecoder().decode([ProductResponse].self, from: json)
                            for prRes in productsResponse {
                                productsArray.append(prRes)
                            }
                            
                            resolver.fulfill(productsArray)
                            
                        }catch(let error){
                            print(error)
                            
                        }
                        
                    }
                    
                    
                    // print("my actual response is :- ",data)
                    
                case .failure(let error):
                    resolver.reject(error)
                    print(error)
                }
            }
            
        }
        
    }
    
}
