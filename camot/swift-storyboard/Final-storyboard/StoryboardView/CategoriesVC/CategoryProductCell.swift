//
//  CategoryProductCell.swift
//  Final-storyboard
//
//  Created by error on 2020/12/12.
//

import UIKit

class CategoryProductCell: UITableViewCell {


    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
