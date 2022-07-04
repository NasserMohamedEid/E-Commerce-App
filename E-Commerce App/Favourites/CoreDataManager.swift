//
//  CoreDataManager.swift
//  E-Commerce App
//
//  Created by sherif on 02/07/2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    // singelton pattern
   static let shared = CoreDataManager()
    
    private init (){
        viewContext = appDelegate.persistentContainer.viewContext
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext?
    let userEntityName = "ProductsList"
    
    
    enum mykeys:String,CodingKey {
        
        case image = "productimage"
        case name = "productname"
        case id    = "productid"
    }
    
    
    
    func saveToFavourite(productList:products){
        
        guard let viewContext = viewContext else {return}
        guard let entity = NSEntityDescription.entity(forEntityName: userEntityName,
                                                      in: viewContext) else { return }
        

            let saveProduct = NSManagedObject(entity: entity,
                                              insertInto: viewContext)
            saveProduct.setValue(productList.images?[0].src, forKey: mykeys.image.rawValue)
            saveProduct.setValue(productList.title, forKey: mykeys.name.rawValue)
            saveProduct.setValue(productList.id, forKey: mykeys.id.rawValue)
              

          appDelegate.saveContext()
        
    }
    
    
    func getSavedProducts()->[NSManagedObject]{

        var arr = [NSManagedObject]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: userEntityName)

        do {
           arr = try viewContext!.fetch(fetchRequest)
           

        } catch let error {
            print(error.localizedDescription)
        }
        return arr

    }
    
    
    func delete(){
        
        guard let viewContext = viewContext else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: userEntityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    viewContext.delete(managedObjectData)
                }
                print("deleted!!!!!!!!!!!!!!")
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
    
}
