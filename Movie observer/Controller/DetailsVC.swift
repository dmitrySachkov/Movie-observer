//
//  DetailsVC.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 05.06.2021.
//

import UIKit

@available(iOS 11.0, *)
class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var detailMovieView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    @IBOutlet weak var imdLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var directorsLbl: UILabel!
    @IBOutlet weak var starsLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    
    
    var movieTitle = ""
    var movieYear = ""
    var movieGenre = ""
    var director = ""
    var actors = ""
    var plot = ""
    var moviePoster = ""
    var imdbRating = ""
    var runtime = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(detailMovieView)
        detailMovieView.clipsToBounds = true
        detailMovieView.layer.cornerRadius = 50
        detailMovieView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        setupVC(name: movieTitle, runtime: runtime, imd: imdbRating, genre: movieGenre, directors: director, stars: actors, plot: plot, poster: moviePoster)
 
    }
    
    // MARK: - Setup data on screen
    private func setupVC(name: String, runtime: String, imd: String, genre: String, directors: String, stars: String, plot: String, poster: String) {
        runtimeLbl.text = runtime
        imdLbl.text = imd
        titleLbl.text = name
        genreLbl.text = genre
        directorsLbl.text = directors
        starsLbl.text = stars
        plotLbl.text = plot
        NetworkService.shared.getImageAlbum(urlStr: poster, completion: { image in
            self.movieImg.image = image
        })
    }
}
