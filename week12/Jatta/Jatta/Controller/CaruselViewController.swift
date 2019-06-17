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


enum WordLevel: String {
    case easy="easy"
    case medium="medium"
    case hard="hard"
}

class CaruselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var cards=[Card]()
    var level: WordLevel = .hard
    let wordsKey = "wordsKey"
    let userDefaults = UserDefaults.standard
    let userdefaults=UserDefaults.standard
    var selectedCards=[Card]()
    
    @IBOutlet weak var walkThroughCollectionView:UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWord()
        
        selectedCardsSaved()
        print("selected cards: \(selectedCards)")
        print("viewDidLOad cards \(cards)")
        removeElements(cards: cards)
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        walkThroughCollectionView.register(UINib.init(nibName: "WalkThroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walkThroughIdentifier")
        walkThroughCollectionView.register(UINib.init(nibName: "FinalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FinalCollectionViewCell")
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
    func selectedCardsSaved(){
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
            selectedCards=cardsArray
            walkThroughCollectionView.reloadData()
        }

    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }
    func removeElements(cards:[Card]){
        print(" негизи ремув болу керек cards \(cards)")
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
            for i in cardsArray{
                print("element of cardsArray \(i)")
                print(i.initialWord)
                print("loop of cardsArray \(self.cards)")
                
                for card in self.cards{
                    print(card.initialWord)
                    if i.initialWord == card.initialWord{
                        print(card.initialWord)
                        if let index = self.cards.firstIndex(of:card) {
                            print("index:\(index)")
                            self.cards.remove(at: index)
                        }
                    }
                }
            }
            walkThroughCollectionView.reloadData()
        }
    }
    func fetchWord(){
        print ("i am fetch")
        var ref:DatabaseReference?
        var databaseHandle: DatabaseHandle?
        ref = Database.database().reference()
        databaseHandle=ref?.child(level.rawValue).observe(.value ){ (snapshot) in
                if let words = snapshot.value as? [Any] {
                    for word in words {
                        let word2 = word as? [String: Any]
                        let card = Card(initialWord: word2?["init_word"] as! String , finalWord: word2?["fin_word"] as! String, image: word2?["image"] as! String)
                        self.cards.append(card)
                        print("fetch word : \(self.cards)")
                    }
                    DispatchQueue.main.async {
                        self.walkThroughCollectionView.reloadData()
                    }
                }
            print("okonchatel'nyi fetch word : \(self.cards)")
            self.removeElements(cards: self.cards)
        }
        print ("cards \(cards)")
//        removeElements(cards: self.cards)
        print ("cards \(self.cards)")
    }
    // MARK: - UICollectionView Delegate and DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(6, cards.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if ((indexPath.row) == 5) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinalCollectionViewCell", for: indexPath) as! FinalCollectionViewCell
            print("finalCollectionview: \(selectedCards.count)")
            cell.setScore(wordcount: selectedCards.count)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifier", for: indexPath) as! WalkThroughCollectionViewCell
//            let word = cards[indexPath.row - (indexPath.row / 5)]
            let word = cards[indexPath.row]
            cell.setWord(word)
            return cell
        }
    }
    var arr:[Int]=[]
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [],animations: {cell!.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)},completion: { finished in UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5,animations: {
            cell!.transform = CGAffineTransform(scaleX: 1, y: 1)},completion: nil)})
        
//        let character = cards[(indexPath as NSIndexPath).row]
//        let alert = UIAlertController(title: "Печальяно", message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
        let word=cards[indexPath.item]
//        self.walkThroughCollectionView.scrollToItem(at:IndexPath(item: indexPath.item+1, section: indexPath.section), at: .left, animated: false)

//        walkThroughCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        if indexPath.item == 5{
            let storyboard=UIStoryboard.init(name: "Main", bundle: nil)
            let vc=storyboard.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
            let nc=UINavigationController.init(rootViewController: vc)
            present(nc, animated: true)
        }else{
//            walkThroughCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 30))

            if !selectedCards.isEmpty{
                if !selectedCards.contains(word){
                    selectedCards.append(word)
                }
            }else{
                selectedCards.append(word)
            }
            
            let used=indexPath.item
            
            if !arr.contains(indexPath.item){
                arr.append(used)
            }
            UserDefaults.standard.set(arr, forKey: "key")
            print(arr)
            
        }
        let userDefaults = UserDefaults.standard
        let encodedData:Data = NSKeyedArchiver.archivedData(withRootObject: selectedCards)
        userDefaults.set(encodedData, forKey: wordsKey)
        userDefaults.synchronize()
        
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
            let character = self.cards[self.currentPage]
        }
    }
    fileprivate var pageSize: CGSize {
        let layout = self.walkThroughCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.walkThroughCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        
        // add these two lines
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView(self.walkThroughCollectionView, didSelectItemAt: indexPath)
    }
  
    

}
