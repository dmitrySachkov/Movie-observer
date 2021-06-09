//
//  AddMovieVC.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 08.06.2021.
//

import UIKit

class AddMovieVC: UIViewController {
    
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    let defaults = UserDefaults.standard
    var movieNam = ""
    var moviesData = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovie()
    }
    // MARK: - fetch data
    private func fetchMovie() {
            let string = BASE_URL + "&t=\(movieNam)"
            let urlString = string.replacingOccurrences(of: " ", with: "_")
            NetworkService.shared.fetchData(urlStr: urlString, memberType: MovieModel.self) { result in
                self.moviesData.append(result)
                NetworkService.shared.getImageAlbum(urlStr: result.poster) { image in
                    self.posterImg.image = image
                }
                self.movieName.text = result.title
                self.moviePlot.text = result.plot
            }
    }
    
    // MARK: - Add data to UserDefaults
    @IBAction func addButtonPressed(_ sender: Any) {
        var moviesArray = defaults.object(forKey: "MoviesArray") as? [String] ?? [String]()
        moviesArray.append(movieNam)
        defaults.setValue(moviesArray, forKey: "MoviesArray")
    }
    
}
