//
//  MyTableViewCell.swift
//  Week3
//
//  Created by Junho Lee on 2022/04/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"

    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicDescriptionLabel: UILabel!
    @IBOutlet weak var moveButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(_ musicData: MusicDataModel) {
        albumCoverImageView.image = musicData.albumImage
        musicTitleLabel.text = musicData.musicTitle
        musicDescriptionLabel.text = musicData.description
    }
    
}
