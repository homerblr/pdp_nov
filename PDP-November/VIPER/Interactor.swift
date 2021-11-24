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
        
        let venueEntity: [VenueEntity] = [VenueEntity(venueName: "Sweet and sour", venueAdress: "Miroshnichenko st16A", venueRating: 4.3, totalVenueRatingCount: 200, image: UIImage(named: "rest1")!), VenueEntity(venueName: "Bergamo", venueAdress: "Gamarnika st 1-a", venueRating: 5.0, totalVenueRatingCount: 230, image: UIImage(named: "rest2")!), VenueEntity(venueName: "Some restarunt", venueAdress: "Nemiga, 3", venueRating: 2.1, totalVenueRatingCount: 14, image: UIImage(named: "rest3")!), VenueEntity(venueName: "Best restaraunt", venueAdress: "Fabriciusa, 32", venueRating: 1.1, totalVenueRatingCount: 3, image: UIImage(named: "rest4")!)]
        let categoryEntity: [CategoryEntity] = [CategoryEntity(categoryName: "Pizza", numberOfPlaces: 1200, image: UIImage(named: "pizza")!), CategoryEntity(categoryName: "Burgers", numberOfPlaces: 810, image: UIImage(named: "Shape")!), CategoryEntity(categoryName: "Steaks", numberOfPlaces: 10, image: UIImage(named: "meat")!), CategoryEntity(categoryName: "Italiano", numberOfPlaces: 94, image: UIImage(named: "spaguetti")!)]
        
        presenter?.interactorDidFetchVenueData(data: venueEntity)
        presenter?.interactorDidFetchCategoryData(data: categoryEntity)
    }
}


