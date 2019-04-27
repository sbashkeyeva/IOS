//
//  CaruselViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class CaruselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var dataWord = [String]() {
        didSet {
            walkThroughCollectionView.reloadData()
        }
    }
    var cards=[Card]()
    @IBOutlet weak var walkThroughCollectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        walkThroughCollectionView.register(UINib.init(nibName: "WalkThroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walkThroughIdentifier")
        let flowLayout=UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width-60.0, height: walkThroughCollectionView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        walkThroughCollectionView.collectionViewLayout=flowLayout
        walkThroughCollectionView.delegate = self
        walkThroughCollectionView.dataSource = self
        cards.append(Card.init(initialWord: "mother", finalWord: "мама", typeWord: "noun", image: "stitch"))
        
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        DatabaseRetrieve.getData(completion: { (word) in 
            self.dataWord.append(word)
            self.walkThroughCollectionView.reloadData()
        })
    }
    
    // MARK: - UICollectionView Delegate and DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataWord.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
        cell.titleLabel.text="Title - \(indexPath.row+1)"
        cell.titleLabel.text=dataWord[indexPath.row]
        cell.subTitleLabel.text="SubTitle - \(indexPath.row+1)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("selected item -- \(indexPath.row)")
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
