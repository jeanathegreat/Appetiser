//
//  MovieViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    //var detailedMovie = Movie(trackId: 4, trackName: "Stardust", trackGenre: "Romance", trackPrice: 456789, trackImage: #imageLiteral(resourceName: "placeholder"), longDescription: "The quick brown fox jumps over the lazy dog repeat 100x so that this will become long.")
    @IBOutlet weak var movieThumbImg: UIImageView!
    @IBOutlet weak var movieLongDescLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI()
    {
        //movieThumbImg.image = movie?.trackImage 
        movieLongDescLabel.text = movie?.longDescription
        movieGenreLabel.text = movie?.trackGenre
        moviePriceLabel.text = String(movie!.trackPrice)
        movieTitle.text = movie?.trackName
    }

}
