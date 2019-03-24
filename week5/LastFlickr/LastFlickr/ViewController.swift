//
//  ViewController.swift
//  LastFlickr
//
//  Created by Symbat Bashkeyeva on 3/16/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    let API_KEY:String="a4b37395099be89c391ec2670f74cec0"
    let URL:String="https://api.flickr.com/services/rest/"
    let GET_METHOD:String="flickr.photos.getRecent"
    let FORMAT_TYPE:String="json"
    let API_SIG:String="83acd30286ca3cddf49954d273e74514"
    let JSON_CALLBACK:String="1"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getPhotoData()
        }
    func getPhotoData(){
        let parameters:[String:String]=["method":GET_METHOD,"api_key":API_KEY, "format":FORMAT_TYPE, "nojsoncallback":JSON_CALLBACK, "api_sig":API_SIG]
        Alamofire.request(URL, method: .get, parameters: parameters).responseJSON{
            (response) in
            print(request)
            switch response.result{
            case .success(let val):
                print(val)
                var photos=[Photo]()
                let arr=JSON(val)["photos"]["photo"].arrayValue
                for var element in arr{
                    photos.append(Photo.init(json: element))
                    print(photos)
                }
                print(arr)
            case .failure(let error):
                print(error)
                
            }
//            if response.result.isSuccess {
////                print(response.result.value)
//                print("Success! Get the Photo Data")
//
//                let photoJSON:JSON=JSON(response.result.value!)
//                print(photoJSON)
//
//            }
//            else{
//                print("Error \(String(describing: response.result.error))")
//            }
            
        }
        
    }


}

