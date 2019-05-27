//
//  QuizViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    
    
  
    @IBOutlet weak var walkThroughCollectionView: UICollectionView!
    let wordsKey="wordsKey"
    var cards=[Card]()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSaved()
        print("selected cards: \(cards)")
        
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        walkThroughCollectionView.register(UINib.init(nibName: "WalkThroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walkThroughIdentifier")
        let flowLayout=UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width-60.0, height: walkThroughCollectionView.frame.size.height-20.0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        walkThroughCollectionView.collectionViewLayout=flowLayout
        walkThroughCollectionView.delegate = self
        walkThroughCollectionView.dataSource = self
    }
    @objc func closeTapped(){
        dismiss(animated: true)
    }
    func selectedSaved(){
        guard let cardData = UserDefaults.standard.object(forKey: wordsKey) as? NSData else {
            print("'cards' not found in UserDefaults")
            return
        }
        
        // Пытаемся разархивировать полученные данные
        guard let cardsArray = NSKeyedUnarchiver.unarchiveObject(with: cardData as Data) as? [Card] else {
            print("Could not unarchive from cardData")
            return
        }
        // В случае успеха, если в архиве есть хотябы один контакт присваиваем массивву contacts данные кэшированного массива и обновляем tableView
        if cardsArray.count > 0 {
            cards=cardsArray
//            tableView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = walkThroughCollectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
        let word=cards[indexPath.row]
        cell.setWord(word)
        return cell
    }
    
    
}
