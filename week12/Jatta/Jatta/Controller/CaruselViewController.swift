//
//  CaruselViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

protocol  CaruselDelegate {
    func didSendWord(card:Card)
}

enum WordLevel: String {
    case easy="easy"
    case medium="medium"
    case hard="hard"
}

class CaruselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var dataWords = [String]() {
        didSet {
            walkThroughCollectionView.reloadData()
        }
    }
    var cards=[Card]()
    var level: WordLevel = .hard
    let wordsKey = "wordsKey"
    let userDefaults = UserDefaults.standard
    var delegate: CaruselDelegate?
    
    @IBOutlet weak var walkThroughCollectionView:UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWord()
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        
//        loadData()
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
//        cards.append(Card.init(initialWord: "mother", finalWord: "мама", typeWord: "noun", image: "stitch"))
        
        // Do any additional setup after loading the view.
    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }
    
    func fetchWord(){
        
        var ref:DatabaseReference?
        var databaseHandle: DatabaseHandle?
        ref = Database.database().reference()
        databaseHandle=ref?.child(level.rawValue).observe(.value ){ (snapshot) in
                if let words = snapshot.value as? [Any] {
                    for word in words {
                        let word2 = word as? [String: Any]
                        let card = Card(initialWord: word2?["init_word"] as! String , finalWord: word2?["fin_word"] as! String, image: word2?["image"] as! String)
//                        card.initialWord = word2?["init_word"] as? String
//                        card.finalWord = word2?["fin_word"] as? String
//                        card.image = word2?["image"] as? String
                        self.cards.append(card)
                        DispatchQueue.main.async {
                            self.walkThroughCollectionView.reloadData()
                        }
                    
                    }
                    
                }
        }
    }
    func loadData() {
        DatabaseRetrieve.getData(completion: { (word) in 
            self.dataWords.append(word)
            self.walkThroughCollectionView.reloadData()
        })
    }
    
    // MARK: - UICollectionView Delegate and DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return min(5, cards.count)
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
            return cell
            
        } else {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
            let word = cards[indexPath.row]
            cell.setWord(word)
            return cell
        }
    }
    let userdefaults=UserDefaults.standard
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item -- \(indexPath.row)")
        let word=cards[indexPath.item]
//        let id = 5
//        UserDefaults.standard.setValue([id], forKey: "LastPassedId")
//        var v = UserDefaults.standard.value(forKey: "LastPassedId")
//        UserDefaults.standard.removeObject(forKey: "12312")
        
        let userDefaults = UserDefaults.standard
        let encodedData:Data = NSKeyedArchiver.archivedData(withRootObject: word)
        userDefaults.set(encodedData, forKey: wordsKey)
        userDefaults.synchronize()
        let decoded  = userDefaults.data(forKey: wordsKey)
        let decodedTeam = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Card
        print("decoded trams")
        print(decodedTeam)
        delegate?.didSendWord(card: decodedTeam)
        
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
