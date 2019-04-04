//
//  MovieViewController.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Kingfisher


// MARK: Sets up the MovieViewController with data passed by the master view controller (MoviesListViewController) via the object Movie
class MovieViewController: UIViewController {

    @IBOutlet private weak var movieThumbImg: UIImageView!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    @IBOutlet private weak var moviePriceLabel: UILabel!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieLongDescLabel: UITextView!
    
    public var movie: Movie?
    private static let placeHolderImgURL = "http://alittlebitbazar.net/wp-content/uploads/2017/06/wood-blog-placeholder-100x100.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false

        setupUI()
    }
    
    // MARK: Setups various UIView elements with data obtained from Movie object
    private func setupUI()
    {
        movieLongDescLabel.text = movie?.description
        movieGenreLabel.text = movie?.genre
        moviePriceLabel.text = String(movie!.price ?? 0)
        movieTitle.text = movie?.name
        let url = URL(string: movie?.imageURL ?? MovieViewController.placeHolderImgURL)!
        movieThumbImg.kf.setImage(with: .network(url))
    }
}
