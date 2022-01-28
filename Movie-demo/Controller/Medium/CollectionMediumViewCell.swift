//
//  CollectionMediumViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 18/1/2565 BE.
//

import UIKit

class CollectionMediumViewCell: UICollectionViewCell {
    
    static let indentify = "cellMedium"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
