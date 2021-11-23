//
//  MainPresenterImplementation.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

class MainPresenterImplementation: MainPresenter {
    weak var view: MainView!
    
    private var venueModel: [VenueModel] = []
    private var categoryModel: [CategoryModel] = []
    
    func viewDidLoad() {
       //Network call thru Service layer
        venueModel = [VenueModel(venueName: "Sweet and sour", venueAdress: "Miroshnichenko st16A", venueRating: 4.3, totalVenueRatingCount: 200, image: UIImage(named: "rest1")!), VenueModel(venueName: "Bergamo", venueAdress: "Gamarnika st 1-a", venueRating: 5.0, totalVenueRatingCount: 230, image: UIImage(named: "rest2")!), VenueModel(venueName: "Some restarunt", venueAdress: "Nemiga, 3", venueRating: 2.1, totalVenueRatingCount: 14, image: UIImage(named: "rest3")!), VenueModel(venueName: "Best restaraunt", venueAdress: "Fabriciusa, 32", venueRating: 1.1, totalVenueRatingCount: 3, image: UIImage(named: "rest4")!)]
        categoryModel = [CategoryModel(categoryName: "Pizza", numberOfPlaces: 1200, image: UIImage(named: "pizza")!), CategoryModel(categoryName: "Burgers", numberOfPlaces: 810, image: UIImage(named: "Shape")!), CategoryModel(categoryName: "Steaks", numberOfPlaces: 10, image: UIImage(named: "meat")!), CategoryModel(categoryName: "Italiano", numberOfPlaces: 94, image: UIImage(named: "spaguetti")!)]
        view?.updateCollectionViews()
    }
    
    func getVenueName(index: Int) -> String {
        return venueModel[index].venueName
    }
    func getVenueAdress(index: Int) -> String {
        return venueModel[index].venueAdress
    }
    func getVenueImage(index: Int) -> UIImage {
         return venueModel[index].image
    }
    func getVenueRating(index: Int) -> String {
        return String(venueModel[index].venueRating)
    }
    func getVenueRatingCounts(index: Int) -> String {
       return String("(ratings: \(venueModel[index].totalVenueRatingCount))")
    }
    func getNumberOfRows() -> Int {
        return venueModel.count
    }
    
    func getCategoryName(index: Int) -> String {
        return categoryModel[index].categoryName
    }
    func getCategoryNumberOfPlaces(index: Int) -> String {
        return String("\(categoryModel[index].numberOfPlaces) places")
    }
    func getCategoryImage(index: Int) -> UIImage {
        return categoryModel[index].image
    }
    
}
