//
//  ViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 01/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Moya

class MoviesListViewController: UIViewController {

    @IBOutlet weak private var movieTableView: UITableView!
    let provider = MoyaProvider<ITunesSearchAPI>()
    
    // MARK: - View State
    private var state: State = .loading {
        didSet {
            switch state {
            case .ready:
                movieTableView.reloadData()
            case .loading:
                print("loading")
            case .error:
                print("error")
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        state = .loading

        //MARK: Get request done through Moya network framework
        provider.request(.search(term: "star", country: "au", media: "movie"))
        {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(ITunesSearchResults<Movie>.self, from: response.data).results
                    self.state = .ready(result)
                } catch { self.state = .error }
            case .failure(_):
                self.state = .error
            }
        }
        }

}

// MARK: ViewController states
extension MoviesListViewController {
    enum State {
        case loading
        case ready([Movie])
        case error
    }
}

// MARK: TableViewDelegates and TableViewDataSource
// Populates and depopulates table cell in tableview according to data in Movie object
extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.reuseIdentifier, for: indexPath) as? MovieListCell ?? MovieListCell()

        guard case .ready(let items) = state else { return cell }
        
        cell.setMovieListCell(with: items[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .ready(let items) = state else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard case .ready(let items) = state else { return }
        performSegue(withIdentifier: "showMoreMovieDetails", sender: items[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showMoreMovieDetails" {
            let secondVC = segue.destination as! MovieViewController
            secondVC.movie = sender as? Movie
        }
    }
}
