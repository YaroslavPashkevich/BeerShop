//
//  FavouriteBeerMVPPresenter.swift
//  BeerRecepts
//
//  Created  Yaroslav on 28.11.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Alamofire
import MBProgressHUD
import SDWebImage
import CoreData


// MARK: Presenter -
protocol FavouriteBeerMVPPresenterProtocol {
    
    var view: FavouriteBeerMVPViewProtocol? { get set }
    func infoBeerCartImage(for indexPath: IndexPath) -> String
    func infoBeerCart(for indexPath: IndexPath) -> String
    func numberOfCategoriesBeerCart() -> Int
    func viewDidLoad()
    func removeBeerInCart(for indexpath: IndexPath)
}

class FavouriteBeerMVPPresenter: FavouriteBeerMVPPresenterProtocol {
    
    
    weak var view: FavouriteBeerMVPViewProtocol?
    
    var beerFavorite: [ReceptBeers] = []
   
    
    func addBeer() {
        DatabaseService.shared.entitiesFor(
            type: ReceptBeers.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { [weak self] val in
                guard let self = self else {return}
                self.beerFavorite = val
                self.view?.reloadData()
            }
        )
    }
    
   
    
    func infoBeerCartImage(for indexPath: IndexPath) -> String {
        return beerFavorite[indexPath.row].beerImageUrl
    }
   
    func infoBeerCart(for indexPath: IndexPath) -> String {
        return beerFavorite[indexPath.row].beer
    }
    func numberOfCategoriesBeerCart() -> Int {
        return beerFavorite.count
    }
    
    func removeBeerInCart(for indexpath: IndexPath) {
        
        DatabaseService.shared.delete(
            beerFavorite[indexpath.row],
            context: DatabaseService.shared.persistentContainer.mainContext) { _ in
                self.beerFavorite.remove(at: indexpath.row)
                DatabaseService.shared.saveMain(nil)
                self.view?.reloadData()
            }
    }
    
    func viewDidLoad() {
        
        addBeer()
    }
}
