//
//  TestViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class TestViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var cards=[Card]()
     let wordsKey = "wordsKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        tableView.delegate=self
        tableView.dataSource=self
//        let userDefaults=UserDefaults.standard
//        let decoded  = userDefaults.data(forKey: wordsKey)
//        let decodedTeam = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Card]
//        cards=decodedTeam
//        print("decoded trams")
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
            tableView.reloadData()
        }
        
    }
    @objc func closeTapped() {
        dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ZZZ: \(cards.count)" )
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CardTableViewCell
        let card=cards[indexPath.row]
        cell.setWord(card: card)
        print("HELLLLLLOOO")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }


}
