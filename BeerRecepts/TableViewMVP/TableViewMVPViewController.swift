//
//  TableViewMVPViewController.swift
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

// MARK: View -
protocol TableViewMVPViewProtocol: AnyObject {
    
    func reloadData()
    
}

class TableViewMVPViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var presenter: TableViewMVPPresenterProtocol = TableViewMVPPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Список"
        presenter.view = self
        presenter.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyCell", bundle: Bundle.main), forCellReuseIdentifier: "MyCell")
    }
}

extension TableViewMVPViewController: TableViewMVPViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

extension TableViewMVPViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else {
            return UITableViewCell()
        }

        cell.update(with: presenter.categoryBeer(for: indexPath))
        cell.cellImage()

        return cell
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCategoriesBeer()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let infoBeerVC = StoryboardScene.InfoBeerMVP.infoBeerMVPViewController.instantiate()
        infoBeerVC.presenter.infoBeer(info: presenter.infoBeer(for: indexPath))
        navigationController?.pushViewController(infoBeerVC, animated: true)
    }
 
    @IBAction private func cart()  {
      
        let cartVC = StoryboardScene.FavouriteBeerMVP.favouriteBeerMVPViewController.instantiate()
        navigationController?.pushViewController(cartVC, animated: true)
        
    }
    
}

struct Recept:Decodable  {
    
    var name: String
    var image_url: String
    var description: String
    var abv: Double
    var tagline: String
}
