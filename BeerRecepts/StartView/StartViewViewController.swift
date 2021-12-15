//
//  StartViewViewController.swift
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
protocol StartViewViewProtocol: AnyObject {

}

class StartViewViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

	var presenter: StartViewPresenterProtocol = StartViewPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    imageView.sd_setImage(with: URL(string: "https://st.depositphotos.com/1001686/2320/i/600/depositphotos_23203474-stock-photo-cold-beer-bottle-with-drops.jpg"))
        

        presenter.view = self
        presenter.viewDidLoad()
    }
    
    @IBAction private func buttonStartPressed() {
        let tableViewVC = StoryboardScene.TableViewMVP.tableViewMVPViewController.instantiate()
        navigationController?.pushViewController(tableViewVC, animated: true)
     
      
    }
    
    
}



extension StartViewViewController: StartViewViewProtocol {
    
}
