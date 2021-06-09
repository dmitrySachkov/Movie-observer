//
//  MovieCell.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 02.06.2021.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    @IBOutlet weak var imdbRatingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupItemCell(name: String, genre: String, year: String, runtime: String, imdbRating: String, poster: String) {
        movieNameLbl.text = name
        genreLbl.text = genre
        releasedLbl.text = year
        runtimeLbl.text = runtime
        imdbRatingLbl.text = imdbRating
        NetworkService.shared.getImageAlbum(urlStr: poster, completion: { image in
            self.posterImg.image = image
        })
    }

}
