//
//  SearchVc.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 07.06.2021.
//

import UIKit

@available(iOS 11.0, *)
class SearchVC: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    private var timer: Timer?
    var searchText = ""
    var moviesData = [Search]()
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
        setupTableView()
    }
    
    //MARK: - TableView setup
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Search Bar setup
    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
}

//MARK: - Add search Bar
@available(iOS 11.0, *)
extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        let uString = BASE_URL + "&s=\(searchText)"
        let urlString = uString.replacingOccurrences(of: " ", with: "_").lowercased()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false, block: { (_) in
           print(urlString)
            NetworkService.shared.fetchData(urlStr: urlString, memberType: SearchModels.self) { result in
                self.moviesData = result.search
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - Add Table View Delegate and Data Sourse
@available(iOS 11.0, *)
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchResultCell
        let movieData = moviesData[indexPath.row]
        cell.setupCell(name: movieData.title, year: movieData.year, image: movieData.poster)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "AddMovieVC") as! AddMovieVC
            let movieData = moviesData[indexPath.item]
            vc.movieNam = movieData.title
            navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
       
    }
}
