//
//  FilterView.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

protocol FilterView: BaseView {
    func updateTableView()
}

extension FilterView where Self: UIViewController {}
