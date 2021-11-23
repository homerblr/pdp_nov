//
//  CategoryModel.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 18.11.21.
//

import Foundation
import UIKit

class CategoryModel {
    let categoryName: String
    let numberOfPlaces: Int
    let image: UIImage
    
    init(categoryName: String, numberOfPlaces: Int, image: UIImage) {
        self.categoryName = categoryName
        self.numberOfPlaces = numberOfPlaces
        self.image = image
    }
}

