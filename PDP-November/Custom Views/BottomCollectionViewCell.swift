//
//  BottomCollectionViewCell.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 18.11.21.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var numberOfPlacesLabel: UILabel!
    @IBOutlet weak var imageCointaine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.applyshadowWithCorner(containerView: imageCointaine, cornerRadious: 3)
       
        // Initialization code
    }
    

}

fileprivate extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
