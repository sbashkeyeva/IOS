//
//  ListOfPhotoViewController.swift
//  LastFlickr
//
//  Created by Symbat Bashkeyeva on 3/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ListOfPhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let API_KEY:String="05ba7e17ff5ed73a2136f0d679a8e4a4"
    let URL:String="https://api.flickr.com/services/rest/"
    let GET_METHOD:String="flickr.photos.getRecent"
    let FORMAT_TYPE:String="json"
    let API_SIG:String="df7f07889ddcd9b631082104f6a85222"
    let JSON_CALLBACK:String="1"
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoData()
        // Do any additional setup after loading the view.
    }
    func getPhotoData(){
        let parameters:[String:String]=["method":GET_METHOD,"api_key":API_KEY, "format":FORMAT_TYPE, "nojsoncallback":JSON_CALLBACK, "api_sig":API_SIG]
        Alamofire.request(URL, method: .get, parameters: parameters).responseJSON{
            (response) in
            switch response.result{
            case .success(let val):
//                print(val)
                var photos=[Photo]()
                let arr=JSON(val)["photos"]["photo"].arrayValue
                for element in arr{
                    photos.append(Photo.init(json: element))
                }
                print(arr)
//                print(json)
//                print(photos.count)
//                print(arr)
            case .failure(let error):
                print(error)
                
                
            }
            
        }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.textLabel.text=String(indexPath.row)
        cell.backgroundColor=UIColor.green
        return cell
    }
    
}
