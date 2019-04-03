//
//  MovieViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {

    //var detailedMovie = Movie(trackId: 4, trackName: "Stardust", trackGenre: "Romance", trackPrice: 456789, trackImage: #imageLiteral(resourceName: "placeholder"), longDescription: "The quick brown fox jumps over the lazy dog repeat 100x so that this will become long.")
    @IBOutlet weak var movieThumbImg: UIImageView!
    @IBOutlet weak var movieLongDescLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie?
    private static let placeHolderImgURL = "http://alittlebitbazar.net/wp-content/uploads/2017/06/wood-blog-placeholder-100x100.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        setupUI()
    }
    
    func setupUI()
    {
        movieLongDescLabel.text = movie?.longDescription
        movieGenreLabel.text = movie?.trackGenre
        moviePriceLabel.text = String(movie!.trackPrice ?? 0)
        movieTitle.text = movie?.trackName
        let url = URL(string: movie?.imageURL ?? MovieViewController.placeHolderImgURL)!
        movieThumbImg.kf.setImage(with: .network(url))
    }
}
