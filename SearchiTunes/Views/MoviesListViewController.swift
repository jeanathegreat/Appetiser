//
//  ViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 01/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Alamofire

class MoviesListViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    var movieListArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        createMovieListArray(ofCount: 50)
        movieTableView.delegate = self
        movieTableView.dataSource = self 
    }

    func createMovieListArray(ofCount: Int)
    {
        for index in 0..<ofCount
        {
            let movie = Movie(trackId: index, trackName: "Movie No. \(index)", trackGenre: "Genre \(index)", trackPrice: index*1000, trackImage: #imageLiteral(resourceName: "placeholder"), longDescription: "Long long long long long long long long long assdescription")
            movieListArray += [movie]
        }
        print(movieListArray)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //        secondViewController.detailedMovie.trackGenre = sender.trackGenre
        //        secondViewController.detailedMovie.trackName = sender.trackName
        //        secondViewController.detailedMovie.trackPrice = sender.trackPrice
        //        secondViewController.detailedMovie.trackImage = sender.trackImage
        //        secondViewController.detailedMovie.longDescription = sender.longDescription
//        let secondViewController = segue.destination as! MovieViewController
//        secondViewController.movieGenre = sender.trackGenre
//        secondViewController.movieName = sender.trackName
//        secondViewController.moviePrice = sender.trackPrice
//        secondViewController.movieImg = sender.trackImage
        
        if segue.identifier == "showMoreMovieDetails" {
            let secondVC = segue.destination as! MovieViewController
            secondVC.movie = sender as? Movie
        }
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
    
}
