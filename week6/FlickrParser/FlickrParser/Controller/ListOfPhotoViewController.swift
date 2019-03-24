//
//  ListOfPhotoViewController.swift
//  FlickrParser
//
//  Created by Symbat Bashkeyeva on 3/20/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListOfPhotoViewController: UIViewController, UICollectionViewDelegate{
    var photos:[Photo]=[]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFlickrPhotos()
        collectionView.dataSource=self
        collectionView.delegate=self
        // Do any additional setup after loading the view.
    }
    
    func getFlickrPhotos(){
        SVProgressHUD.show()
        PhotoService.fetchFlickrPhotos(){
            (photos)  in
            SVProgressHUD.dismiss()
            if let photos=photos{
                self.photos=photos
                self.collectionView.reloadData()
            }
            print("Success")
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
// MARK: - Collection View
extension ListOfPhotoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photos.count)
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
//        cell.textLabel.text=items[indexPath.item]
//        cell.backgroundColor=UIColor.green
        let photo=photos[indexPath.row]
        cell.imageURL=photo.url
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoController = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        photoController.photo=photos[indexPath.row]
        self.navigationController?.pushViewController(photoController, animated: true)
        
    }
    
    
}
// MARK: - FlowLayout
extension ListOfPhotoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let itemWidth=collectionView.bounds.width/3
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
