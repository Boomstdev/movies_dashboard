//
//  TableSmallViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 19/1/2565 BE.
//

import UIKit

class TableSmallViewCell: UITableViewCell {
    
    
    static let indentify = "tableSmallCell"
    
    var movieItem: [MovieItemModel]!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet var collectionSmallView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        title.attributedText = NSAttributedString(string: "Text", attributes:
                                                    [.underlineStyle: NSUnderlineStyle.single.rawValue])
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = screenWidth/2.5
        let hight = screenHeight/4
        layout.itemSize = CGSize(width: width , height: hight)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        
        collectionSmallView.delegate = self
        collectionSmallView.dataSource = self
        collectionSmallView.collectionViewLayout = layout
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension TableSmallViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = movieItem[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionSmallViewCell.indentify, for: indexPath) as! CollectionSmallViewCell
        cell.image.load(url: item.imageUrl)
        cell.lblName.text = item.name
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5
        return cell
    }
    
    
}
