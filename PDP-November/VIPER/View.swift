//
//  View.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation
import UIKit

protocol ViperView: MainView {
    var presenter: AnyPresenter? { get set }
}


class ViperMainView: UIViewController, ViperView {
    var presenter: AnyPresenter?
    
    func updateCollectionViews() {
        print("collectionView.updateData")
    }
    
    
}
