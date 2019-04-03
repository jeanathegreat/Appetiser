//
//  ViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 01/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Moya
import Alamofire

class MoviesListViewController: UIViewController {

    @IBOutlet weak private var movieTableView: UITableView!
    let provider = MoyaProvider<ITunesSearchAPI>()
    var movieListArray = [Movie]()
    
    let url = "https://is2-ssl.mzstatic.com/image/thumb/Video3/v4/59/11/e8/5911e892-4fcd-6827-6a0a-7c49b2cdc3d7/source/100x100bb.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //TODO: what's wrong with this movieList array
        createMovieListArray(ofCount: 50)
        
        //TODO: check this provider gah
        provider.request(.search(term: "star", country: "au", media: "movie")) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    //print(try response.mapJSON())
                    let jsonObj = try response.mapJSON()
                    print(jsonObj)
                } catch {
                    //self.state = .error
                }
            case .failure:
                //self.state = .error
                print("error")
            }
        }
        
            
        }

    func createMovieListArray(ofCount: Int)
    {
        for index in 0..<ofCount
        {
            //TODO: how to load thumbnail
            let movie = Movie(trackId: index, trackName: "Movie No. \(index)", trackGenre: "Genre \(index)", trackPrice: index*1000, /*trackImage: url,*/ longDescription: "Long long long long long long long long long assdescription")
            movieListArray += [movie]
        }
        //print(movieListArray)
    }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieListArray[indexPath.row]
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as! MovieListCell
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.reuseIdentifier, for: indexPath) as? MovieListCell ?? MovieListCell()
        
        cell.setMovieListCell(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showMoreMovieDetails", sender: movieListArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showMoreMovieDetails" {
            let secondVC = segue.destination as! MovieViewController
            secondVC.movie = sender as? Movie
        }
    }
}
