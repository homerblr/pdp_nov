//
//  Interactor.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func getData()
}

class MainInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getData() {
        print("bzz, getting data from internet")
        let entity = [VenueModel(venueName: "Some", venueAdress: "foo", venueRating: 5.0, totalVenueRatingCount: 1, image: UIImage(named: "some")!)]
        presenter?.interactorDidFetchData(data: entity)
    }
}


