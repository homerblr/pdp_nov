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
        print("title")
    }
    
    private func configure() {
        tagList.addTags(["American", "Turkish", "Asian", "Fast Food", "Pizza", "Ice Cream", "Shawerma"])
    }
    
}
