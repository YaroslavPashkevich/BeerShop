//
//  TableViewMVPPresenter.swift
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

// MARK: Presenter -
protocol TableViewMVPPresenterProtocol {
    var view: TableViewMVPViewProtocol? { get set }
    func viewDidLoad()
    func categoryBeer(for indexPath: IndexPath) -> String
    func numberOfCategoriesBeer() -> Int
    func infoBeer(for indexPath: IndexPath) -> Recept 
}

class TableViewMVPPresenter: TableViewMVPPresenterProtocol {
    
    weak var view: TableViewMVPViewProtocol?
    
    private var beers: [Recept] = []
    
    func viewDidLoad() {
        categoryBeerShow()
        view?.reloadData()
    }
    
    func categoryBeerShow() {
        
        AF.request("https://api.punkapi.com/v2/beers",method: .get).responseDecodable(of:[Recept].self) { response in
            let result = response.result
            switch result {
            case .success(_):
            guard let value = response.value else { return }
            self.beers = value
            self.view?.reloadData()
                
            case .failure(_):
                self.view?.error()
            }
        }
            
    }
    
    func categoryBeer(for indexPath: IndexPath) -> String {
        return beers[indexPath.row].name
    }
    func infoBeer(for indexPath: IndexPath) -> Recept {
        return beers[indexPath.row]
    }
    
    func numberOfCategoriesBeer() -> Int {
        return beers.count
    }
}
