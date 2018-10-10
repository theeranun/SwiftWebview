//
//  ProductCell.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 26/9/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    func fill(with product: Product){
        imageView.image = product.image
        titleLabel.text = product.title
    }
}
