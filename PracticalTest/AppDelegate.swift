//
//  AppDelegate.swift
//  PracticalTest
//
//  Created by MAD2 on 9/12/19.
//  Copyright © 2019 MAD2. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var contactList:[Contact] = []
    
    func StoreTestAccount(){
        
        //fetch request for data
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDAccount")
        
       
        do {
            //fetching list of coredata to see if anything is inside
             let list:[NSManagedObject] = try context.fetch(fetchRequest)
    
            //if nothing is in list
            if list.count == 0{
        
            let entity = NSEntityDescription.entity(forEntityName: "CDAccount", in: context)!
                
                //add person into core data (hardcode)
              let person = NSManagedObject(entity: entity, insertInto: context)
                    person.setValue("user1@gmail.com", forKey: "email")
                    person.setValue("12345678", forKey: "password")
                
            let person2 = NSManagedObject(entity: entity, insertInto: context)
            person2.setValue("admin@apple.com", forKey: "email")
            person2.setValue("root", forKey: "password")
                
                //if creating fails
                do{
                    try context.save()
                } catch let error as NSError{
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            // if retrieving fails
        } catch let error as NSError {
            print("Could not fetch. \(error),\(error.userInfo)")
        }
    }
    
    func CreateDummyContacts(){
        
        //add items to list
        contactList.append(Contact.init(firstname: "Alan", lastname: "Hayes", photo: UIImage(named:"alanhayes")!, telephone: "88221122"))
        contactList.append(Contact.init(firstname: "Jean", lastname: "Yip", photo: UIImage(named: "jeanyip")!, telephone: "55115522"))
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //call function
        StoreTestAccount()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PracticalTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

