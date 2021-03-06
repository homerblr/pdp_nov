//
//  TopCollectionViewCell.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 17.11.21.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var totalRates: UILabel!
    @IBOutlet weak var freeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        freeLabel.layer.cornerRadius = 5
        freeLabel.layer.masksToBounds = true
        // Initialization code
    }
    

}
