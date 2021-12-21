//
//  CartCell.swift
//  BeerRecepts
//
//  Created by  Yaroslav on 7.12.21.
//

import Foundation
import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage

class CartCell:UITableViewCell {
    
    @IBOutlet private weak var imageBeerCartCell:UIImageView!
    @IBOutlet private weak var imageCartCell:UIImageView!
    @IBOutlet private weak var nameBeerLabel:UILabel!
    @IBOutlet private weak var numbersLabel:UILabel!
    @IBOutlet private weak var numberBeersLabel:UILabel!
    @IBOutlet private weak var stepper:UIStepper!
    
  
   
   
    
    func cartCellImage() {
        imageCartCell.sd_setImage(with: URL(string: "https://oir.mobi/uploads/posts/2021-03/1616542792_16-p-pivo-fon-22.jpg"))
    }
   
    
    
    func updateCart(with text: String) {
        nameBeerLabel.text = text
    }
        
    func updateCartImage(image: String) {

    
        imageBeerCartCell.sd_setImage(with: URL(string: image))
    }
    
    @IBAction func stepperCount() {
        
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.autorepeat = true
        
        numberBeersLabel.text = "\(Int(stepper.value))"
        
        stepper.addTarget(self, action: #selector(stepperValueDidChange), for: UIControl.Event.valueChanged)
       
        
    }
    
    @objc func stepperValueDidChange(stepper: UIStepper) {

        let stepperMapping: [UIStepper: UILabel] = [stepper: numberBeersLabel]

        stepperMapping[stepper]!.text = "\(Int(stepper.value))"
    }
}

