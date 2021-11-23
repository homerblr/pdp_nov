//
//  CustomSlider.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 22.11.21.
//

import UIKit
@IBDesignable
class CustomSlider: UISlider {
    
    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(UIImage(named: "Oval 3 Copy"), for: .normal)
        }
    }
    private var thumbTextLabel: UILabel = UILabel()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        return thumb
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbTextLabel.frame = CGRect(x: thumbFrame.origin.x, y: thumbFrame.minY - 30, width: thumbFrame.size.width, height: 30)
        self.setValue()
    }
    
    private func setValue() {
        let formattedText = String(format: "%0.2f", self.value)
        thumbTextLabel.text = "$ \(formattedText)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(thumbTextLabel)
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.textColor = .black
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
        thumbTextLabel.adjustsFontSizeToFitWidth = true
    }
}


