//
//  PhotoViewController.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import SVProgressHUD
class PhotoViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    var photo_id:String=""
    var photo_url:String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        loadInfo()
        // Do any additional setup after loading the view.
    }
    func loadInfo(){
        PhotoDownloader.takePhoto(with: photo_url) { (photo) in
            self.image.image=photo
        }
        PhotoService.getPhotoInfo(photo_id, success: { (photoInfo) in
            self.usernameLabel.text=photoInfo.username
            self.descriptionLabel.text=photoInfo.description
            self.titleLabel.text=photoInfo.title
            self.dateLabel.text=photoInfo.date
            self.viewsLabel.text=photoInfo.views
        }) { (error) in
            SVProgressHUD.dismiss()
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
