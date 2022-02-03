//
//  TableTypeViewCell.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 28/1/2565 BE.
//

import UIKit

class TableTypeViewCell: UITableViewCell {
    
    static let indentify = "cellType"
    
    @IBOutlet weak var lblText: UILabel!
    var typeList:[String]?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
