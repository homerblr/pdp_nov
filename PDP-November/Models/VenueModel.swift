//
//  VenueModel.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 17.11.21.
//

import Foundation
import UIKit

class VenueModel {
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
