//
//  FilterViewController.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 18.11.21.
//

import UIKit
import Pulley

class FilterViewController: UIViewController, FilterView {
    func updateCollectionViews() {
        //
    }
    
    
    enum Sections: Int, CaseIterable {
        case tags
        case sortBy
        case filter
        case price

        func title() -> String? {
            switch self {
            case .tags: return "CUSINES"
            case .sortBy: return "SORT BY"
            case .filter: return "FILTER"
            case .price: return "PRICE"
            default: return nil
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var pullView: UIView!
    
    var presenter: FilterPresenter = FilterPresenterImplementation()
    
    private var modelForSort: [String] = ["Top Rated", "Nearest", "Cost high to low", "Cost low to high"]
    private var modelForFilter: [String] = ["Open Now", "Credit cards", "Free delivery"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.view.backgroundColor = .clear
        tableView.register(UINib(nibName: "TagsTableViewCell", bundle: nil), forCellReuseIdentifier: "tagCell")
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "baseCell")
        tableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "sliderCell")
        tableView.allowsMultipleSelection = true
        pullView.layer.cornerRadius = 3
    }
        
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.pulleyViewController?.setDrawerPosition(position: .closed, animated: true, completion: nil)
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case Sections.tags.rawValue:
            return Sections.tags.title()
        case Sections.sortBy.rawValue:
            return Sections.sortBy.title()
        case Sections.filter.rawValue:
            return Sections.filter.title()
        case Sections.price.rawValue:
            return Sections.price.title()
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Sections.tags.rawValue: return 1
        case Sections.sortBy.rawValue: return 4
        case Sections.filter.rawValue: return 3
        case Sections.price.rawValue: return 1
        default: return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case Sections.tags.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath) as? TagsTableViewCell else { return UITableViewCell() }
            return cell
        case Sections.sortBy.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
            cell.label.text = modelForSort[indexPath.row]
            return cell
        case Sections.filter.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "baseCell", for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
            cell.label.text = modelForFilter[indexPath.row]
            return cell
        case Sections.price.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as? SliderTableViewCell else { return UITableViewCell() }
            return cell
        
        default:
            break
        }
        
      return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case Sections.sortBy.rawValue:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        case Sections.filter.rawValue:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case Sections.sortBy.rawValue:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
        case Sections.filter.rawValue:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
        default: break
        }
    }

}

extension FilterViewController: PulleyDrawerViewControllerDelegate {
    
    
}
