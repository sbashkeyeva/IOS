//
//  AddContactViewController.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
protocol  AddContactDelegate {
    func didCreateContact(contact:Contact)
}

class AddContactViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: AddContactDelegate?
    var contacts=[Contact]()
    var color: UIColor=UIColor.green
    var tagColor:Contact.TagColor=Contact.TagColor.green
    var arr = [Contact.TagColor.AllCases]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource=self
        collectionView.delegate=self
        let addButton = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem=addButton
        contacts.append(Contact.init(firstname: "Hey", lastname: "Krasavica", phone: "888", tagColor: .green))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tagTapped(_ sender: Any) {
        
    }
    
    //    @IBAction func tagTapped(_ sender: UIButton!) {
////        switch tagColor {
////        case Contact.TagColor.blue:
////            sender.backgroundColor=UIColor.blue
////        case Contact.TagColor.red:
////            sender.backgroundColor=UIColor.red
////        case Contact.TagColor.orange:
////            sender.backgroundColor=UIColor.orange
////        case Contact.TagColor.green:
////            sender.backgroundColor=UIColor.green
////        case Contact.TagColor.yellow:
////            sender.backgroundColor=UIColor.yellow
////        }
//        color=sender.backgroundColor ?? UIColor.clear
//
//    }
    @objc func addTapped(){
        guard firstnameField.text != "" else{
            let alert=UIAlertController(title: "Error", message: "Fill out your name", preferredStyle: .alert)
            let action=UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard lastnameField.text != "" else{
            let alert = UIAlertController(title: "Error", message: "Fill out your lastname", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        guard phoneField.text != "" else {
            let alert = UIAlertController(title: "Error", message: "Fill out your phone", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        let contact = Contact.init(firstname: firstnameField.text ?? "", lastname: lastnameField.text ?? "", phone: phoneField.text ?? "", tagColor: tagColor)
        delegate?.didCreateContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCollectionViewCell
        cell.setTag(indexPath.row)
        return cell
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
