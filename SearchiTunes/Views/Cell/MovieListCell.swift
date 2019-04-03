//
//  MovieListCell.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {
    
    public static let reuseIdentifier = "MovieListCell"
    private static let placeHolderImgURL = "http://alittlebitbazar.net/wp-content/uploads/2017/06/wood-blog-placeholder-100x100.jpg"

    @IBOutlet private weak var movieThumbnailView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    @IBOutlet private weak var moviePriceLabel: UILabel!
    
    func setMovieListCell(with: Movie)
    {
        movieTitleLabel.text = with.trackName
        movieGenreLabel.text = with.trackGenre
        moviePriceLabel.text = String(with.trackPrice ?? 0)

        let url = URL(string: with.imageURL ?? MovieListCell.placeHolderImgURL)!
        movieThumbnailView.kf.setImage(with: .network(url))
    }
}
