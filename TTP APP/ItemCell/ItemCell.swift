//
//  ItemCell.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 19/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(image: UIImage, text: String){
        self.imgImage.image = image
        self.txtName.text = text
    }

}
