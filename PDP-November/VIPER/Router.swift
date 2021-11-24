//
//  Router.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation
import UIKit


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    static func start() -> AnyRouter
    var entry: EntryPoint? { get }
}

class MainViperRouter: AnyRouter {
    var entry: EntryPoint?
    static func start() -> AnyRouter {
        let router = MainViperRouter()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viperVC") as? ViperViewController
        var view: ViperView = vc!
        var presenter: AnyPresenter = ViperMainPresenter()
        var interactor: AnyInteractor = MainInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        
        return router
    }
}
