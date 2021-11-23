//
//  ViewModel.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation

struct VenueViewModel {
    var venueViewModel: Observable<[VenueCollectionCellViewModel]> = Observable([])
}

struct VenueCollectionCellViewModel {
    let name: String
    let rating: String
    let totalRating: String
}
