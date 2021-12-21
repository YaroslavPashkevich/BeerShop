//
//  InfoBeerMVPPresenter.swift
//  BeerRecepts
//
//  Created  Yaroslav on 4.12.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Alamofire
import MBProgressHUD
import SDWebImage
import CoreData

// MARK: Presenter -
protocol InfoBeerMVPPresenterProtocol {
    
    var view: InfoBeerMVPViewProtocol? { get set }
    func viewDidLoad()
    func infoBeer(info: Recept)
    func saveName()
 
    
}

class InfoBeerMVPPresenter: InfoBeerMVPPresenterProtocol {
  
    
    
    weak var view: InfoBeerMVPViewProtocol?
    var infoRecept: Recept?
    var count: String?
 
    func infoBeer(info: Recept) {
        infoRecept = info
    }
    
    func saveName() {
        DatabaseService.shared.insertEntityFor(
            type: ReceptBeers.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { beerName in
                guard let infoRecept = self.infoRecept else {return}
                beerName.beer = infoRecept.name
                beerName.beerImageUrl = infoRecept.image_url
                beerName.beerDescription = infoRecept.description
                beerName.beerTagline = infoRecept.tagline
                beerName.beerAbv = infoRecept.abv
                DatabaseService.shared.saveMain(nil)

            }
        )
    }
    

    
    func viewDidLoad() {
        guard let infoRecept = infoRecept else {
            return
        }
        view?.updateInfoBeer(updateInfo: infoRecept)
    }
}
