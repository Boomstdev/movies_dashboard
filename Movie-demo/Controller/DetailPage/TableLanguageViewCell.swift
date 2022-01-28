//
//  TableLanguageViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 28/1/2565 BE.
//

import UIKit

class TableLanguageViewCell: UITableViewCell {
    
    static let indentify = "cellLanguage"
    
    var languageList:[String]?

    @IBOutlet weak var collectionLanguage: UICollectionView!
    @IBOutlet weak var lbltext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionLanguage.delegate = self
        collectionLanguage.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableLanguageViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languageList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = languageList![indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.backgroundColor = UIColor.red
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.systemGray4.cgColor
//        cell.layer.backgroundColor = UIColor.red.cgColor
        let lbl = cell.viewWithTag(10) as! UILabel
        lbl.text = item
        return cell
    }
    
    
}
