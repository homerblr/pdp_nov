//
//  MainView.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

protocol MainView: BaseView {
    func updateCollectionViews()
}

extension MainView where Self: UIViewController {}
