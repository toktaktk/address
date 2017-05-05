//
//  ViewController.swift
//  address
//
//  Created by toktak on 5/5/2560 BE.
//  Copyright © 2560 Pun Corp. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    var provinceJson : JSON!
    var districtJson : JSON!
    var subDistrictJson : JSON!
    

    

    @IBOutlet var provincePicker: UIPickerView!
    @IBOutlet var districtPicker: UIPickerView!
    @IBOutlet var subDistrictPicker: UIPickerView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        //initial data from json file
        
        //province
        if let path = Bundle.main.path(forResource: "changwats", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                
                if provinceJson != JSON.null {
                    
                    provinceJson = jsonObj["th"]["changwats"]
                    
                    print("jsonData:\(provinceJson)")

                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }

        //district
        if let path = Bundle.main.path(forResource: "amphoes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                
                if districtJson != JSON.null {
                    
                    let amphoeArray = jsonObj["th"]["amphoes"].arrayValue
                    var tmpData : Array<Any> = []

                    for amphoe in amphoeArray
                    {
                        print(amphoe["changwat_pid"])
                        
                        if (amphoe["changwat_pid"].stringValue == "10")
                        {
                            
                            tmpData.append(amphoe)
                            
                        }
                        
                    }
                    
                    print(tmpData)
                    districtJson = JSON.init(tmpData)
//
//                    amphoeTableView.reloadData()
                    
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        //sub district
        if let path = Bundle.main.path(forResource: "tambons", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                
                
                if subDistrictJson != JSON.null {
                    
                    let subDistrictArray = jsonObj["th"]["tambons"].arrayValue
                    var tmpData : Array<Any> = []
                    
                    for subDistrict in subDistrictArray
                    {
                        print(subDistrict["amphoe_pid"])
                        
                        if (subDistrict["amphoe_pid"].stringValue == "1001")
                        {
                            
                            tmpData.append(subDistrict)
                            
                        }
                        
                    }
                    
                    subDistrictJson = JSON.init(tmpData)
                    
                    
                    
                    print("jsonData:\(subDistrictJson)")

                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        
        
    }
    
    
    //MARK:- Picker
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == provincePicker
        {
            return 1
        }
        else if pickerView == districtPicker
        {
            return 1
        }
        else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == provincePicker
        {
            return provinceJson.count
        }
        else if pickerView == districtPicker
        {
            return districtJson.count
        }
        else{
            return subDistrictJson.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == provincePicker
        {
            return provinceJson[row]["name"].stringValue
        }
        else if pickerView == districtPicker
        {
            return districtJson[row]["name"].stringValue
        }
        else{
            return subDistrictJson[row]["name"].stringValue
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == provincePicker
        {
            //reload district
        }
        else if pickerView == districtPicker
        {
            //reload sub district
        }
        else
        {
            
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

