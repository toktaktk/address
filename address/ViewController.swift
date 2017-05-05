//
//  ViewController.swift
//  address
//
//  Created by toktak on 5/5/2560 BE.
//  Copyright © 2560 Pun Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var provinceJson : JSON!
    var districtJson : JSON!
    var subDistrictJson : JSON!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        if let path = Bundle.main.path(forResource: "changwats", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                let jsonObj = JSON(data: data)
//                if changwatJson != JSON.null {
//                    
//                    changwatJson = jsonObj["th"]["changwats"]
//                    
//                    changwatTableView.reloadData()
//                    
//                    print("jsonData:\(changwatJson)")
//                } else {
//                    print("Could not get json from file, make sure that file contains valid json.")
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        } else {
//            print("Invalid filename/path.")
//        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

