//
//  MVVMViewController.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 23.11.21.
//

import UIKit
import Pulley

class MVVMViewController: UIViewController, PulleyPrimaryContentControllerDelegate {
    
    let mockVenuekData: [VenueModel] = [VenueModel(venueName: "Sweet and sour", venueAdress: "Miroshnichenko st16A", venueRating: 4.3, totalVenueRatingCount: 200, image: UIImage(named: "rest1")!), VenueModel(venueName: "Bergamo", venueAdress: "Gamarnika st 1-a", venueRating: 5.0, totalVenueRatingCount: 230, image: UIImage(named: "rest2")!), VenueModel(venueName: "Some restarunt", venueAdress: "Nemiga, 3", venueRating: 2.1, totalVenueRatingCount: 14, image: UIImage(named: "rest3")!), VenueModel(venueName: "Best restaraunt", venueAdress: "Fabriciusa, 32", venueRating: 1.1, totalVenueRatingCount: 3, image: UIImage(named: "rest4")!)]
    let mockCategoryData: [CategoryModel] = [CategoryModel(categoryName: "Pizza", numberOfPlaces: 1200, image: UIImage(named: "pizza")!), CategoryModel(categoryName: "Burgers", numberOfPlaces: 810, image: UIImage(named: "Shape")!), CategoryModel(categoryName: "Steaks", numberOfPlaces: 10, image: UIImage(named: "meat")!), CategoryModel(categoryName: "Italiano", numberOfPlaces: 94, image: UIImage(named: "spaguetti")!)]
    
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    private var venueViewModel = VenueViewModel()
    private var categoryViewModel = CategoryViewModel()
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
        venueViewModel.venueViewModel.bind { [weak self] _  in
            DispatchQueue.main.async {
                self?.topCollectionView.reloadData()
            }
        }
        categoryViewModel.categoryViewModel.bind { [weak self] _  in
            DispatchQueue.main.async {
                self?.bottomCollectionView.reloadData()
            }
        }
        fetchData()
    }
    
    func fetchData() {
        venueViewModel.venueViewModel.value = mockVenuekData.map({VenueCollectionCellViewModel(name: $0.venueName, rating: String($0.venueRating), totalRating: String($0.totalVenueRatingCount), image: $0.image)})
        categoryViewModel.categoryViewModel.value = mockCategoryData.map({CategoryCollectionCellViewModel(name: $0.categoryName, numberOfPlaces: String($0.numberOfPlaces), image: $0.image)})
        
    }
}
extension MVVMViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venueViewModel.venueViewModel.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell else { return UICollectionViewCell() }
            cell.venueName.text = venueViewModel.venueViewModel.value?[indexPath.row].name
            cell.rating.text = venueViewModel.venueViewModel.value?[indexPath.row].rating
            cell.totalRates.text = venueViewModel.venueViewModel.value?[indexPath.row].totalRating
            cell.image.image = venueViewModel.venueViewModel.value?[indexPath.row].image
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCollectionViewCell else { return UICollectionViewCell() }
            cell.foodTypeLabel.text = categoryViewModel.categoryViewModel.value?[indexPath.row].name
            cell.numberOfPlacesLabel.text = categoryViewModel.categoryViewModel.value?[indexPath.row].numberOfPlaces
            cell.imageView.image = categoryViewModel.categoryViewModel.value?[indexPath.row].image
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

