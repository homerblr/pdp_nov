//
//  FilterPresenter.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation

protocol FilterPresenter: BasePresenter {
    var view: FilterView! { get set }
    func didSelectTag(index: Int)
}
