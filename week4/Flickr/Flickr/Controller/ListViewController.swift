//
//  ListViewController.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import SVProgressHUD
class ListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    var photos=[Photo]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource=self
        collectionView.delegate=self
        loadPhotos()
        // Do any additional setup after loading the view.
    }
    func loadPhotos(){
        SVProgressHUD.show()
        PhotoService.getPhoto(success: { (photos) in
            SVProgressHUD.dismiss()
            self.photos=photos
            self.collectionView.reloadData()
        }){(error) in
            SVProgressHUD.dismiss()
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min (50, photos.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.setValue(photos[indexPath.row].url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        controller.photo_id=photos[indexPath.row].id
        controller.photo_url=photos[indexPath.row].url
        self.navigationController?.pushViewController(controller, animated: true)
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
