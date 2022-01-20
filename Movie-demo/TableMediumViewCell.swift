//
//  TableMediumViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 18/1/2565 BE.
//

import UIKit

class TableMediumViewCell: UITableViewCell {
    
    static let indentify = "tableMediumCell"
    
    var movieItem: [MovieItemModel]!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet var collectionMediumView: UICollectionView!

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
        let width = screenSize.width/2.5
        layout.itemSize = CGSize(width: width , height: width * 0.75 )
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        
        
        collectionMediumView.dataSource = self
        collectionMediumView.delegate = self
        collectionMediumView.collectionViewLayout = layout
        collectionMediumView.layer.borderWidth = 1.0
        collectionMediumView.layer.cornerRadius = 5.0
        collectionMediumView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

extension TableMediumViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = movieItem[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionMediumViewCell.indentify, for: indexPath) as! CollectionMediumViewCell
        cell.image.load(url: item.imageUrl)
        cell.lblName.text = item.title
        cell.lblName.layer.borderWidth = 1
        
//        cell.image.image.layer.borderWidth = 1
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
 }
    
}
