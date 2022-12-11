//
//  News.swift
//  cryptocrash
//
//  Created by Athif on 2022-11-18.
//

import Foundation
enum NewsListResult{
    case success([NewsList])
    case failure (Error)
}

class News: Codable {
    var articles: [NewsList]
}
struct NewsList: Codable{
    //var author: String
    var title: String
    var description: String
    var urlToImage: String
}
func fetchNewsList(callback: @escaping (NewsListResult) -> Void){
    NewsAPIHelper.fetch { fetchResult in
        switch fetchResult {
        case .success(let data):
            do{
                let decoder = JSONDecoder()
                let news = try decoder.decode(News.self, from: data)
                
                OperationQueue.main.addOperation {
                    callback(.success(news.articles))
                    //print(news.articles)
                }
                
            } catch let e {
                print("could not parse json data \(e)")
            }
        case .failure(let error):
            print("there was an error fetchin information \(error)")
        }

    }
}
