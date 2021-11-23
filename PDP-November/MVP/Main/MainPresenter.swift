//
//  MainPresenter.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

protocol MainPresenter: BasePresenter {
    func viewDidLoad()
    var view: MainView! { get set }
    func getVenueName(index: Int) -> String
    func getVenueAdress(index: Int) -> String
    func getVenueImage(index: Int) -> UIImage
    func getVenueRating(index: Int) -> String
    func getVenueRatingCounts(index: Int) -> String
    func getNumberOfRows() -> Int
    func getCategoryName(index: Int) -> String
    func getCategoryNumberOfPlaces(index: Int) -> String
    func getCategoryImage(index: Int) -> UIImage 
}
