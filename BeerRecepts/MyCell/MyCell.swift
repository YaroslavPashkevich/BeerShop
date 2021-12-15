//
//  MyCell.swift
//  BeerRecepts
//
//  Created by  Yaroslav on 28.11.21.
//

import Foundation
import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage

class MyCell: UITableViewCell {
    
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var screenCellImageView: UIImageView!
    
    
    func cellImage() {
        screenCellImageView.sd_setImage(with: URL(string: "https://oir.mobi/uploads/posts/2021-03/1616542792_16-p-pivo-fon-22.jpg"))
    }
    
    func update(with text: String) {
        categoryLabel.text = text
    }
}
