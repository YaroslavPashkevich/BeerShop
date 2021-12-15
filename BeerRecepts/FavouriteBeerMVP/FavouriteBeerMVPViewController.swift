//
//  FavouriteBeerMVPViewController.swift
//  BeerRecepts
//
//  Created  Yaroslav on 28.11.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage
import CoreData

// MARK: View -
protocol FavouriteBeerMVPViewProtocol: AnyObject {
    
    func reloadData()
}

class FavouriteBeerMVPViewController: UIViewController {
    
    @IBOutlet private weak var screenImageView: UIImageView!
    @IBOutlet private weak var cartTableView:UITableView!
    @IBOutlet private weak var backToTableButton:UIButton!
    @IBOutlet private weak var buyToTableButton:UIButton!
    
    var presenter: FavouriteBeerMVPPresenterProtocol = FavouriteBeerMVPPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
        
        cartTableView.register(UINib(nibName: "CartCell", bundle: Bundle.main), forCellReuseIdentifier: "CartCell")
        
        screenImageView.sd_setImage(
            with:URL(string:"https://cdn.pixabay.com/photo/2019/09/18/21/12/dark-4487690_960_720.jpg"))
        
        backToTableButton.layer.cornerRadius = 20
        buyToTableButton.layer.cornerRadius = 20
        
        
        
    }
    
    @IBAction func buyBeerButtonPressed() {
        let alertBuyBeer = UIAlertController(title: "Подтверждение", message: "Нажмите ОК для подтверждения", preferredStyle: .alert)
        alertBuyBeer.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            print("Покупка совершена")
           }))
        alertBuyBeer.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: { _ in
            print("Покупка не совершена")
           }))
        present(alertBuyBeer, animated: true, completion: nil)
    }
       
    @IBAction func backToTableButtonPressed() {
        let tableVC = StoryboardScene.TableViewMVP.tableViewMVPViewController.instantiate()
        navigationController?.pushViewController(tableVC, animated: true)
    }
}

extension FavouriteBeerMVPViewController: FavouriteBeerMVPViewProtocol {
    func reloadData() {
        cartTableView.reloadData()
    }
}

extension FavouriteBeerMVPViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = cartTableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell else {
            return UITableViewCell()
        }
        cartCell.updateCart(with: presenter.infoBeerCart(for: indexPath))
        cartCell.updateCartImage(image: presenter.infoBeerCartImage(for: indexPath))
        cartCell.cartCellImage()
        cartCell.stepperCount()
        return cartCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCategoriesBeerCart()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeBeer = UISwipeActionsConfiguration(
            actions: [
                UIContextualAction(
                    style: .destructive,
                    title: "Delete",
                    handler: { _, _, _ in
                        self.presenter.removeBeerInCart(for: indexPath)
                    }
                )
            ]
        )
        return removeBeer
    }
    
}
