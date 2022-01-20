//
//  TableRotateViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 14/1/2565 BE.
//

import UIKit

class TableRotateViewCell: UITableViewCell {
    
    static let indentify = "tableRotateCell"
    
    var movieItem: [MovieItemModel]!
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet var collectionRotateView: UICollectionView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = screenSize.width
        layout.itemSize = CGSize(width: width , height: width )
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
//        collectionRotateView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.indentify)
        collectionRotateView.dataSource = self
        collectionRotateView.delegate = self
        collectionRotateView.collectionViewLayout = layout
        collectionRotateView.isPagingEnabled = true
       
        DispatchQueue.main.async {
            self.pageIndicator.numberOfPages = self.movieItem.count
        }
        pageIndicator.currentPage = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TableRotateViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieItem.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = movieItem[indexPath.row]
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.indentify, for: indexPath) as! CollectionViewCell
//
//        cell.image.load(url: item.imageUrl)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellBig", for: indexPath) as! CollectionRotateViewCell
        cell.image.load(url: item.imageUrl)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 300, height: 300)
//
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(pageNumber)
    }

}
