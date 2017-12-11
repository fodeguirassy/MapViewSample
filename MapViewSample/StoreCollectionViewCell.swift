//
//  StoreCollectionViewCell.swift
//  MapViewSample
//
//  Created by School on 06/12/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderColor = UIColor.red.cgColor
        self.contentView.layer.borderWidth = 2
    }
    
}
