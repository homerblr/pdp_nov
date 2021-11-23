//
//  ViewController.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 17.11.21.
//

import UIKit
import Pulley

class ViewController: UIViewController, PulleyDrawerViewControllerDelegate {
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var topModel: [VenueModel]?
    private var bottomModel: [CategoryModel]?
    private var drawerIsOpened: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        topModel = [VenueModel(venueName: "Sweet and sour", venueAdress: "Miroshnichenko st16A", venueRating: 4.3, totalVenueRatingCount: 200, image: UIImage(named: "rest1")!), VenueModel(venueName: "Bergamo", venueAdress: "Gamarnika st 1-a", venueRating: 5.0, totalVenueRatingCount: 230, image: UIImage(named: "rest2")!), VenueModel(venueName: "Some restarunt", venueAdress: "Nemiga, 3", venueRating: 2.1, totalVenueRatingCount: 14, image: UIImage(named: "rest3")!), VenueModel(venueName: "Best restaraunt", venueAdress: "Fabriciusa, 32", venueRating: 1.1, totalVenueRatingCount: 3, image: UIImage(named: "rest4")!)]
        
        bottomModel = [CategoryModel(categoryName: "Pizza", numberOfPlaces: 1200, image: UIImage(named: "pizza")!), CategoryModel(categoryName: "Burgers", numberOfPlaces: 810, image: UIImage(named: "Shape")!), CategoryModel(categoryName: "Steaks", numberOfPlaces: 10, image: UIImage(named: "meat")!), CategoryModel(categoryName: "Italiano", numberOfPlaces: 94, image: UIImage(named: "spaguetti")!)]
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        topCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "topCell")
        
        bottomCollectionView.register(UINib(nibName: "BottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bottomCell")
    }


    @IBAction func showAllTapped(_ sender: UIButton) {
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        drawerIsOpened = !drawerIsOpened
        drawerIsOpened ? pulleyViewController?.setDrawerPosition(position: .closed, animated: true, completion: nil) : pulleyViewController?.setDrawerPosition(position: .partiallyRevealed, animated: true, completion: nil)
        
      
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell, let model = topModel else { return UICollectionViewCell() }
            
            cell.configure(image: model[indexPath.row].image, venueName: model[indexPath.row].venueName, address: model[indexPath.row].venueAdress, rating: model[indexPath.row].venueRating, totalRates: model[indexPath.row].totalVenueRatingCount)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCollectionViewCell, let model = bottomModel else { return UICollectionViewCell() }
            cell.configure(image: model[indexPath.row].image, categoryName: model[indexPath.row].categoryName, numberOfPlaces: model[indexPath.row].numberOfPlaces)
            
//            cell.configure(image: model[indexPath.row].image, venueName: model[indexPath.row].venueName, address: model[indexPath.row].venueAdress, rating: model[indexPath.row].venueRating, totalRates: model[indexPath.row].totalVenueRatingCount)
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
