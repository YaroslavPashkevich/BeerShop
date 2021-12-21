//
//  InfoBeerMVPViewController.swift
//  BeerRecepts
//
//  Created  Yaroslav on 4.12.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage
import CoreData


// MARK: View -
protocol InfoBeerMVPViewProtocol: AnyObject {

    func updateInfoBeer(updateInfo: Recept)

  
}

class InfoBeerMVPViewController: UIViewController {
    @IBOutlet private weak var screenImageView: UIImageView!
    @IBOutlet private weak var beerImageView: UIImageView!
    @IBOutlet private weak var infoBeerLabel:UILabel!
    @IBOutlet private weak var infoNameBeerLabel:UILabel!
    @IBOutlet private weak var abvBeerLabel:UILabel!
    @IBOutlet private weak var abvTextBeerLabel:UILabel!
    @IBOutlet private weak var taglineBeerLabel:UILabel!
    @IBOutlet private weak var buttonBasket:UIButton!
    @IBOutlet private weak var cartLabel:UILabel!
    
    var presenter: InfoBeerMVPPresenterProtocol = InfoBeerMVPPresenter()

   

	override func viewDidLoad() {
        super.viewDidLoad()
        
        cartLabel.text = "В корзину"
        cartLabel.textColor = .blue
        abvTextBeerLabel.text = "ALCOHOL"
        
   
        screenImageView.sd_setImage(with: URL(string: "https://static8.depositphotos.com/1004373/892/i/950/depositphotos_8920819-stock-photo-mug-of-beer.jpg"))
            
        presenter.view = self
        presenter.viewDidLoad()
    }
    
    @IBAction private func basket() {
        buttonBasket.backgroundColor = .blue
       
        cartLabel.text = "В корзине"
        cartLabel.textColor = .white
        presenter.saveName()
      
    }
    
    @IBAction private func cart()  {
        let cartVC = StoryboardScene.FavouriteBeerMVP.favouriteBeerMVPViewController.instantiate()
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    
}

    extension InfoBeerMVPViewController: InfoBeerMVPViewProtocol {
            
    func updateInfoBeer(updateInfo: Recept) {
        beerImageView.sd_setImage(with: URL(string: updateInfo.image_url))
        infoNameBeerLabel.text = updateInfo.name
        infoBeerLabel.text = updateInfo.description
        abvBeerLabel.text  = String(updateInfo.abv) + "%"
        taglineBeerLabel.text = updateInfo.tagline
    }
        
}
