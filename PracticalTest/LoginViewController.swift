//
//  LoginViewController.swift
//  PracticalTest
//
//  Created by MAD2 on 9/12/19.
//  Copyright © 2019 MAD2. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class LoginViewController:UIViewController{
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnLogin(_ sender: Any) {
        
        //retrieve data from app delegate
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDAccount")
        
           do{
                    //place all accounts from CD into list
                   let accountList = try context.fetch(fetchRequest) as! [CDAccount]
            
                //for each account in account list
               for r in accountList{
                //if login details is stored in coredata
                if r.email == txtEmail.text! && r.password == txtPassword.text!
                {
                    //link to storyboard with "grnavcontroller" identifier - nav controller
                    let vc = self.storyboard?.instantiateViewController(identifier: "grnavcontroller")
                    present(vc!, animated: false, completion: nil)
                }
                   }
               } catch {
                   print(error)
               }
        
    }
    
    
    
    
    
}
