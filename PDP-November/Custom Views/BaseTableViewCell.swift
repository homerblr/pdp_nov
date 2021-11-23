//
//  BaseTableViewCell.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 22.11.21.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        label.textColor = selected ? .red : .black
    }
    
}
