//
//  GRUITableViewController.swift
//  PracticalTest
//
//  Created by Pig face on 9/12/19.
//  Copyright © 2019 MAD2. All rights reserved.
//

import Foundation

import UIKit

class GRUITableViewController:UITableViewController{
    
    var contactList:[Contact] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //call method to create
        appDelegate.CreateDummyContacts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //Retrieve recipes and ingredients from core datas
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //retrieve contactlist from app delegate
        contactList = appDelegate.contactList
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //"cell" -> attributes -> identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let recipeController:RecipeController = RecipeController()
        
        //retrieve data from contact list
        let contact = contactList[indexPath.row]
        
        //display details into each cell
        cell.imageView?.image = contact.photo
        cell.textLabel?.text = "\(contact.firstname) \(contact.lastname) \(contact.telephone)"
        
        return cell
    }
    
}
