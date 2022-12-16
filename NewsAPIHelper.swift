//
//  NewsAPIHelper.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/4/21.
//

import Foundation
enum FetchResult{
    case success(Data)
    case failure(Error)
}

struct NewsAPIHelper{
    private static var baseURL : String = "https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=D08d6b3c579542f0abbae1f6a3c3949a"
    //private static var apiKey: String = "&apiKey=D08d6b3c579542f0abbae1f6a3c3949a"
    private static var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    static func fetch(url: String = baseURL, callback: @escaping (FetchResult) -> Void){
        guard
            let url = URL(string: url)
        else{return}
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                callback(.success(data))
            }else if let error = error {
                callback(.failure(error))
            }
            }
        
        task.resume()
    }

    }
