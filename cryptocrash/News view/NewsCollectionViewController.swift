//
//  NewsCollectionViewController.swift
//  cryptocrash
//
//  Created by Athif on 2022-11-18.
//

import UIKit

private let reuseIdentifier = "news"

class NewsCollectionViewController: UICollectionViewController {
    var newsList = [NewsList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var indicator = UIActivityIndicatorView()
        
        func activityIndicator() {
            indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            indicator.style = UIActivityIndicatorView.Style.large
            indicator.color = .gray
            indicator.center = self.view.center
            self.view.addSubview(indicator)
            fetchNews()
        }
        //Initializing the Activity Indicator
        activityIndicator()
        //Starting the Activity Indicator
        indicator.startAnimating()
        
        //func fetch news includes fetch news API and stop spinner animation
        func fetchNews(){
            fetchNewsList{ newsListResult in
            switch newsListResult {
                case .success( let array):
                    self.newsList = array
                self.collectionView.reloadData()
                case .failure( let error):
                    print(error)
                 }
                indicator.stopAnimating()
            }
        }

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DetailCollectionViewCell
    
        // Configure the cell
        cell.title.text = newsList[indexPath.row].title
        cell.content.text = newsList[indexPath.row].description

        do{
  
            cell.image.image = UIImage(data: try NSData(contentsOf: NSURL(string: newsList[indexPath.row].urlToImage)! as URL) as Data)
                }catch let error{
                    print(error)
           }

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
