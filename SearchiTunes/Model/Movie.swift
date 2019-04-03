//
//  Movie.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation
import UIKit

class Movie
{
    var trackId: Int
    var trackName: String
    var trackGenre: String
    var trackPrice: Int
    var trackImage: UIImage
    var longDescription: String
    
    init(trackId: Int, trackName: String, trackGenre: String, trackPrice: Int, trackImage: UIImage, longDescription: String)
    {
        self.trackId = trackId
        self.trackName = trackName
        self.trackGenre = trackGenre
        self.trackPrice = trackPrice
        self.longDescription = longDescription
        self.trackImage = trackImage
    }
}
