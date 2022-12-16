//
//  CoreDataFetch.swift
//  cryptocrash
//
//  Created by Athif on 2022/11/18.
//

import Foundation
import CoreData
import UIKit
class CoreDataFetch : NSObject{
    //add data to the core data
    func addData (name: String, img: String, price: String, high: String, low: String, date: String){
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate
        else {return}
    
        let viewContext = appdelegate.persistentContainer.viewContext
        //set entity and set value types to be saved in the setting manner
        if let cryptoEntity = NSEntityDescription.entity(forEntityName: "Cryptos", in: viewContext){
            let crypData = NSManagedObject(entity: cryptoEntity, insertInto: viewContext)
            crypData.setValue(img, forKey: "cryptoImg")
            crypData.setValue(name, forKey: "cryptoName")
            crypData.setValue(high, forKey: "cryptoHigh")
            crypData.setValue(low, forKey: "cryptoLow")
            crypData.setValue(price, forKey: "cryptoPrice")
            crypData.setValue(date, forKey: "date")
        }
        
        if viewContext.hasChanges{
            do{
                try viewContext.save()
                print("action: save")
            }catch let error as NSError{
                print("not Save==\(error),\(error.userInfo)")
            }
        }
    }
    //load data from core data
    func fetchData( callback: @escaping ([(String,String,String,String,String,String)]) -> Void){
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate
        else {return}
    
        let viewContext = appdelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cryptos")
        do{
            let crypData = try viewContext.fetch(fetchRequest)
            //set an array to receive data from the coredata and structure them in an array
            var newArray = [(cyname: String, cyimg: String, cyprice: String, cylow: String, cyhigh: String, cydate: String)]()
            
            for (index, crypData) in crypData.enumerated(){
                let name: String = crypData.value(forKey: "cryptoName") as! String
                let img: String = crypData.value(forKey: "cryptoImg") as! String
                let price: String = crypData.value(forKey: "cryptoPrice") as! String
                let low: String = crypData.value(forKey: "cryptoLow") as! String
                let high: String = crypData.value(forKey: "cryptoHigh") as! String
                let date: String = crypData.value(forKey: "date") as! String
                
                newArray.append((cyname: name, cyimg: img, cyprice: price, cylow: low, cyhigh: high, cydate: date))
            }
            //send back the array
            callback(newArray)
        }catch let error as NSError{
            print("not fetch==\(error),\(error.userInfo)")
        }
    }
}
