//
//  SearchResultCell.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 07.06.2021.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCell(name: String, year: String, image: String) {
        movieName.text = name
        movieYear.text = year
        NetworkService.shared.getImageAlbum(urlStr: image) { image in
            self.posterImg.image = image
        }
    }
}
