//
//  StartViewPresenter.swift
//  BeerRecepts
//
//  Created  Yaroslav on 28.11.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Presenter -
protocol StartViewPresenterProtocol {
	var view: StartViewViewProtocol? { get set }
    func viewDidLoad()
}

class StartViewPresenter: StartViewPresenterProtocol {

    weak var view: StartViewViewProtocol?

    func viewDidLoad() {

    }
}
