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
    var color: TagColor = .red
    var tagColors:[TagColor] = [.red, .blue, .green, .yellow, .orange]

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
        let contact = Contact.init(firstname: firstnameField.text ?? "", lastname: lastnameField.text ?? "", phone: phoneField.text ?? "", tagColor: color)
        
//        Contact.oneSave(contact: contact)
        delegate?.didCreateContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCollectionViewCell
//        var image:UIImage=UIImage(named: "ic-check")
//        cell.checkImage.image=UIImage(named: "ic-check")
        cell.setTagColor(tagColors[indexPath.item])
        cell.checkImage.isHidden=true
//        if color==tagColors[indexPath.item]{
//            cell.checkImage.image=UIImage(named: "ic-check")
//        }
//        else{
//
//        }
        if cell.isSelected{
            cell.checkImage.image=UIImage(named: "ic-check")
        }
        return cell
    }
    var yoyo: Bool=false
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item==0{
            color = .red
//            color=UIColor.red
        }
        if indexPath.item==1{
            color = .blue
        }
        if indexPath.item==2{
            color = .green
//            color=UIColor.yellow
        }
        if indexPath.item==3{
            color = .yellow
//            color=UIColor.green
        }
        if indexPath.item==4{
            color = .orange
//            color=UIColor.orange
        }
        collectionView.reloadData()
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
