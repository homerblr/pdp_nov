//
//  View.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import Foundation
import UIKit
import Pulley

protocol AnyView {
    var presenter: AnyPresenter? { get set}
}

protocol ViperView: AnyView {
    func update(with entity: [VenueEntity])
    func update(with entity: [CategoryEntity])
}

class ViperViewController: UIViewController, ViperView, PulleyPrimaryContentControllerDelegate {
    
    var presenter: AnyPresenter?
    
    private var venueModel: [VenueEntity] = []
    private var categoryModel: [CategoryEntity] = []
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    private var drawerIsOpened: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        drawerIsOpened = !drawerIsOpened
        drawerIsOpened ? pulleyViewController?.setDrawerPosition(position: .closed, animated: true, completion: nil) : pulleyViewController?.setDrawerPosition(position: .partiallyRevealed, animated: true, completion: nil)
    }
    private func configure() {
        topCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "topCell")
        bottomCollectionView.register(UINib(nibName: "BottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bottomCell")
    }
    
    func update(with entity: [VenueEntity]) {
        DispatchQueue.main.async {
            self.venueModel = entity
            self.topCollectionView.reloadData()
        }
    }
    func update(with entity: [CategoryEntity]) {
        DispatchQueue.main.async {
            self.categoryModel = entity
            self.bottomCollectionView.reloadData()
        }
    }
}
extension ViperViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venueModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell else { return UICollectionViewCell() }
            cell.venueName.text = venueModel[indexPath.row].venueName
            cell.rating.text = String(venueModel[indexPath.row].venueRating)
            cell.totalRates.text = String(venueModel[indexPath.row].totalVenueRatingCount)
            cell.image.image = venueModel[indexPath.row].image
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCollectionViewCell else { return UICollectionViewCell() }
            cell.foodTypeLabel.text = categoryModel[indexPath.row].categoryName
            cell.numberOfPlacesLabel.text = String(categoryModel[indexPath.row].numberOfPlaces)
            cell.imageView.image = categoryModel[indexPath.row].image
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topCollectionView {
            return CGSize(width: 201, height: 341)
        } else {
            return CGSize(width: 90, height: 140)
        }
    }
}



