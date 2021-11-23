//
//  BaseView.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit

protocol Presentable: AnyObject {
    var toPresent: UIViewController { get }
}

extension Presentable where Self: UIViewController {
    var toPresent: UIViewController {
        self
    }
}

protocol BaseView: Presentable {
    func updateCollectionViews()
}

extension BaseView where Self: UIViewController {}
