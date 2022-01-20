//
//  CollectionSmallViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 19/1/2565 BE.
//

import UIKit

class CollectionSmallViewCell: UICollectionViewCell {
    static let indentify = "cellSmall"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
