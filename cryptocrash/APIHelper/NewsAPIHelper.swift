//
//  NewsAPIHelper.swift
//  cryptocrash
//
//  Created by Athif on 2022/11/18.
//

import Foundation
enum FetchResult{
    case success(Data)
    case failure(Error)
}

struct NewsAPIHelper{
    private static var baseURL : String = "https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=c335e85f1a8d4565a9f03b25186167df"
    //https://newsapi.org Added API from following url
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
