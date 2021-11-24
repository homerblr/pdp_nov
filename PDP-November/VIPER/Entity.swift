//
//  Entity.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

class VenueEntity {
    let venueName: String
    let venueAdress: String
    let venueRating: Double
    let totalVenueRatingCount: Int
    let image: UIImage
    
    init(venueName: String, venueAdress: String, venueRating: Double, totalVenueRatingCount: Int, image: UIImage) {
        self.venueName = venueName
        self.venueAdress = venueAdress
        self.venueRating = venueRating
        self.totalVenueRatingCount = totalVenueRatingCount
        self.image = image
    }
}

class CategoryEntity {
    let categoryName: String
    let numberOfPlaces: Int
    let image: UIImage
    
    init(categoryName: String, numberOfPlaces: Int, image: UIImage) {
        self.categoryName = categoryName
        self.numberOfPlaces = numberOfPlaces
        self.image = image
    }
}


