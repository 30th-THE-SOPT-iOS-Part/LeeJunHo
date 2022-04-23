//
//  CollectionViewCell.swift
//  Week3
//
//  Created by Junho Lee on 2022/04/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumImageName: UILabel!
    @IBOutlet weak var albumSinger: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(albumData : AlbumDataModel) {
            albumImageView.image = UIImage(named: albumData.albumImageName)
            albumImageName.text = albumData.albumTitle
            albumSinger.text = albumData.albumSinger
        }

}
