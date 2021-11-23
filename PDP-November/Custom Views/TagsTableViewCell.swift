//
//  TagsTableViewCell.swift
//  PDP-November
//
//  Created by Mikhail Kisly on 22.11.21.
//

import UIKit
import TagListView

class TagsTableViewCell: UITableViewCell, TagListViewDelegate {

    @IBOutlet weak var tagList: TagListView!
    private var tagSelected: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        tagList.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    
    }
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected = !tagSelected
        tagSelected = !tagSelected
    }
    
    
    private func configure() {
        tagList.addTags(["American", "Turkish", "Asian", "Fast Food", "Pizza", "Ice Cream", "Shawerma"])
        
    }
    
}
