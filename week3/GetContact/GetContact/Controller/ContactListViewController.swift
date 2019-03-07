//
//  ContactListViewController.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var contacts=[Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton=UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem=addButton
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        tableView.delegate=self
        tableView.dataSource=self
        contacts.append(Contact.init(firstname: "Mama", lastname: "Papa", phone: "7878787878", tagColor: .blue))
        // Do any additional setup after loading the view.
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    @objc func addTapped(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        controller.delegate=self
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    // MARK: - TableView datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ContactTableViewCell
        let contact=contacts[indexPath.row]
//        cell.textLabel?.text=con.firstname
        cell.setContact(contact)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
     // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
   

}

extension ContactListViewController:AddContactDelegate{
    func didCreateContact(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
    
    
}
