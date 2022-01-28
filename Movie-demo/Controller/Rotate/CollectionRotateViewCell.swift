//
//  CollectionViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 14/1/2565 BE.
//

import UIKit

class CollectionRotateViewCell: UICollectionViewCell {
    
    static let indentify = "cellBig"

    @IBOutlet weak var image: UIImageView!
    var controller = UICollectionViewCell()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        controller = self
    }

}
