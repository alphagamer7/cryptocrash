//
//  DetailViewController.swift
//  cryptocrash
//
//  Created by Athif on 2022-11-18.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    var persistentContainer: NSPersistentContainer!
    var cryptoId: String!
    var cryptoName: String!
    var iconUri: String!
    var priceDec: Decimal!
    var dateSt: String!
    
    var newArray = Array<Any>()
    @IBOutlet weak var Icon: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var highSt: UILabel!

    @IBOutlet weak var lowSt: UILabel!
    @IBOutlet weak var volSt: UILabel!
    
    var CoreDataFetchObj = CoreDataFetch()
    
    @IBAction func clickToAddData(_ sender: Any) {
  
        //use coredata function to save the array of core data attribute
        CoreDataFetchObj.addData(name: self.cryptoName,img: self.iconUri, price: price.text!, high: highSt.text!, low: lowSt.text!, date: dateSt )
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Name.text = cryptoName
        //tranfer price to string format :$ 0.00
        price.text = "$" + DecimalToString(num1: priceDec,formats: "%.2f")
        
        self.dateSt = getDate()
        
        do{
            Icon.image = UIImage(data: try NSData(contentsOf: NSURL(string: iconUri)! as URL) as Data)
        }catch let error{
            print(error)
        }
        
        //fetch history crypto data and calculate daily high and low
        DetailCryptoAPIHelper.fetch( query: cryptoId){ newArray in
            self.newArray = newArray
            let someDict:[String: Any] = newArray[0] as! [String : Any]
            
            let price_open = NSDecimalNumber(decimal: (someDict["price_open"] as! NSNumber).decimalValue)
       
            let price_high = NSDecimalNumber(decimal: (someDict["price_high"] as! NSNumber).decimalValue)
            let price_low = NSDecimalNumber(decimal: (someDict["price_low"] as! NSNumber).decimalValue)
            let volume_traded = NSDecimalNumber(decimal: (someDict["volume_traded"] as! NSNumber).decimalValue)
            
            //do calculation
            let higher: String = calculateToString(num1: price_high, num2: price_open)
            
            let lower: String = calculateToString(num1: price_open, num2: price_low)
            
            //set stats
            self.highSt.text = higher
            self.lowSt.text = lower
            self.volSt.text = NSDecimalToString(num1: volume_traded)
            print("higher",higher)
            print("lower", lower)
            
            }
    }
    

}
