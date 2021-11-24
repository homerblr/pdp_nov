//
//  ViewModel.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation
import UIKit

struct VenueViewModel {
    var venueViewModel: Observable<[VenueCollectionCellViewModel]> = Observable([])
}

struct VenueCollectionCellViewModel {
    let name: String
    let rating: String
    let totalRating: String
    let image: UIImage
}

struct CategoryViewModel {
    var categoryViewModel: Observable<[CategoryCollectionCellViewModel]> = Observable([])
}

struct CategoryCollectionCellViewModel {
    let name: String
    let numberOfPlaces: String
    let image: UIImage
}
