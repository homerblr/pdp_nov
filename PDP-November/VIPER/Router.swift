//
//  Router.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation


protocol AnyRouter {
    static func start() -> AnyRouter
}

class MainViperRouter: AnyRouter {
    static func start() -> AnyRouter {
        let router = MainViperRouter()
        var view: ViperView = ViewController() as! ViperView
        var presenter: AnyPresenter = ViperMainPresenter()
        var interactor: AnyInteractor = MainInteractor()
        
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        view.presenter = presenter
        return router
    }
}
