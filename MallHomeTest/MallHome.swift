//
//  ViewController.swift
//  MallHomeTest
//
//  Created by kiran on 3/14/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

struct groupedCatProducts{
    var catTitle =  String()
    var catProducts = [ProductResponse]()
    
    
    
}


class MallHome: UIViewController {
    
    @IBOutlet weak var productTV: UITableView!
    let mallName = "sherpa-mall"
    let cataId = 92
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductCatFromMall(mallName: mallName)
        //getProductsfromCatId(catId: cataId)
    }
    
    
    var groupedDit = [String]()
    
    var allProductsData = [ProductResponse](){
        didSet{
            _ = Dictionary(grouping: allProductsData, by: {
                $0.catagories!.first!.name
            })
            for ite in allProductsData {
                groupedDit.append(ite.catagories![0].name)
            }
            
         //   print("groupded dict: \(groupedDit[0])")
            //print(groupedDict[groupedDit[0]])
            
            
            
            

        }
    }

    
 
    
    var listOfObjId = [String](){
        didSet{
            for objId in listOfObjId {
                if objId != "" {
                    let objI = Int(objId)
                    getProductsfromCatId(catId: objI!)
                } else {
                    print("object id is nil ")
                }
            }
        }
    }
    
    
    
    
    func  getProductCatFromMall(mallName: String){
        _ = APIManager.api.fetchCatagoryOfMall(mall: mallName)
            .done({ (res) in
                for re in res {
                    self.listOfObjId.append(re.objectID)
                    
                }
            })
        
    }
    
    func getProductsfromCatId(catId: Int){
        let postPacket = PostPacket.shared.getProductsfromCatId(catId: catId)
        _ = APIManager.api.fetchProductsDatafromCatagoryId(params: postPacket)
            .done({ (res) in
                for re in res{
                    self.allProductsData.append(re)
                }
            })
        
    }
    
    
}








extension MallHome: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTV.dequeueReusableCell(withIdentifier: "ProductTVCell", for: indexPath) as! ProductTVCell
        return cell
    }
    
    
    
    
    
    
    
    
}

