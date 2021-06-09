//
//  ViewController.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 02.06.2021.
//

import UIKit

@available(iOS 10.0, *)
class MovieVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    let defaults = UserDefaults.standard
    var moviesData = [MovieModel]()
    var moviesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData()
        setupCollectionView()
        fetchMoviesData()
        
    }

    // MARK: - Collection View setup
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - Save data to movies array
    private func saveData() {
        if moviesArray.isEmpty {
            moviesArray = defaults.object(forKey: "MoviesArray") as? [String] ?? [String]()
            collectionView.reloadData()
        }
    }
    
    // MARK: - Get movies array
    private func fetchMoviesData() {
        for i in moviesArray {
            let string = BASE_URL + "&t=\(i)"
            let urlStr = string.replacingOccurrences(of: " ", with: "_")
            NetworkService.shared.fetchData(urlStr: urlStr, memberType: MovieModel.self) { result in
                self.moviesData.append(result)
                self.collectionView.reloadData()
                }
            }
        }
    
    // MARK: - Get the search bar
    @available(iOS 11.0, *)
    @available(iOS 13.0, *)
    @IBAction func searchButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Get the profile
    @available(iOS 13.0, *)
    @IBAction func profileButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 10.0, *)
extension MovieVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        let dataOfMovies = moviesData[indexPath.item]
        cell.setupItemCell(name: dataOfMovies.title, genre: dataOfMovies.genre, year: dataOfMovies.year, runtime: dataOfMovies.year, imdbRating: dataOfMovies.imdbRating, poster: dataOfMovies.poster)
        return cell
    }

    @available(iOS 10.0, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
            let movieData = moviesData[indexPath.item]
            vc.movieTitle = movieData.title
            vc.actors = movieData.actors
            vc.director = movieData.director
            vc.imdbRating = movieData.imdbRating
            vc.movieGenre = movieData.genre
            vc.runtime = movieData.runtime
            vc.plot = movieData.plot
            vc.moviePoster = movieData.poster
            navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
        
    }
}
