//
//  Presenter.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: ViperView? { get set }
    func interactorDidFetchVenueData(data: [VenueEntity])
    func interactorDidFetchCategoryData(data: [CategoryEntity])
}

class ViperMainPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getData()
        }
    }
    
    var view: ViperView?
    
    func interactorDidFetchVenueData(data: [VenueEntity]) {
        view?.update(with: data)
    }
    func interactorDidFetchCategoryData(data: [CategoryEntity]) {
        view?.update(with: data)
    }
}
