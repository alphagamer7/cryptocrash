//
//  IconAPIHelper.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/3/31.
//

import Foundation
struct IconAPIHelper{
    //no use because the coin.API won't allow to make queries in one API > 2 times
    private static let baseURL: String = "https://rest.coinapi.io/v1/assets/icons/64"
    private static var apiKey: String = "?apikey=36264472-F1D6-4F28-82FE-72076D780687"
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    static func fetch(callback: @escaping (Array<Any>) -> Void){
        guard
            let url = URL(string: baseURL + apiKey)
        else{return}
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
     
                    let jsonObject1 = try JSONSerialization.jsonObject(with: data, options: [])
                    guard
                        let jsonDictionary1 = jsonObject1 as? Array<Any>

                    else {preconditionFailure("could not parse JSOn data")}
                    //print(jsonDictionary[0])
                    
                    OperationQueue.main.addOperation {
                        callback(jsonDictionary1)
                    }
                } catch let e {
                    print("error \(e)")
                }
            } else if let error = error {
                print("there was an error: \(error)")
            } else {
                print("something went wrong")
            }
        }
        task.resume()
    }
}
