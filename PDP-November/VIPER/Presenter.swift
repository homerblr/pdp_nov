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
    func interactorDidFetchData(data: [VenueModel])
}

class ViperMainPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: ViperView?
    
    init(){
        interactor?.getData()
    }
    
    func interactorDidFetchData(data: [VenueModel]) {
        view?.updateCollectionViews()
    }
}
