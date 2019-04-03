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

    @IBOutlet private weak var movieThumbnailView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    @IBOutlet private weak var moviePriceLabel: UILabel!
    
    func setMovieListCell(with: Movie)
    {
        // TODO: how to load thumbnail
        //movieThumbnailView.image = with.trackImage
        movieTitleLabel.text = with.trackName
        movieGenreLabel.text = with.primaryGenreName
        moviePriceLabel.text = String(with.trackPrice ?? 0)
        
        // TODO: how to use load thumbnail
        //movieThumbnailView.kf.setImage(with: with.trackImage.url,options: [.transition(.fade(0.3))])
    }
}
