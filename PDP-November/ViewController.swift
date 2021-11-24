//
//  ViewController.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 17.11.21.
//

import UIKit
import Pulley

class ViewController: UIViewController, BaseView, PulleyPrimaryContentControllerDelegate, MainView {
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var drawerIsOpened: Bool = true
    var presenter: MainPresenter = MainPresenterImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        launchMVVM()
        //        launchViper()
    }
    
    @IBAction func showAllTapped(_ sender: UIButton) {
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        drawerIsOpened = !drawerIsOpened
        drawerIsOpened ? pulleyViewController?.setDrawerPosition(position: .closed, animated: true, completion: nil) : pulleyViewController?.setDrawerPosition(position: .partiallyRevealed, animated: true, completion: nil)
    }
    
    func updateCollectionViews() {
        topCollectionView.reloadData()
        bottomCollectionView.reloadData()
    }
    
    private func configure() {
        topCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "topCell")
        bottomCollectionView.register(UINib(nibName: "BottomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bottomCell")
    }
    
    private func launchViper() {
        let userRouter = MainViperRouter.start()
        let initialVC = (userRouter.entry)!
        self.pulleyViewController?.setPrimaryContentViewController(controller: initialVC, animated: false)
    }
    
    private func launchMVVM() {
        let primaryContent = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mvvmVC")
        self.pulleyViewController?.setPrimaryContentViewController(controller: primaryContent, animated: false)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopCollectionViewCell else { return UICollectionViewCell() }
            cell.venueName.text = presenter.getVenueName(index: indexPath.row)
            cell.image.image = presenter.getVenueImage(index: indexPath.row)
            cell.rating.text = presenter.getVenueRating(index: indexPath.row)
            cell.totalRates.text = presenter.getVenueRatingCounts(index: indexPath.row)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCollectionViewCell else { return UICollectionViewCell() }
            cell.foodTypeLabel.text = presenter.getCategoryName(index: indexPath.row)
            cell.numberOfPlacesLabel.text = presenter.getCategoryNumberOfPlaces(index: indexPath.row)
            cell.imageView.image = presenter.getCategoryImage(index: indexPath.row)
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
